----------------------------------------------------------------------------------
-- File Name: vga_controller.vhd
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_controller is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  VGA_in_red : in std_logic_vector(3 downto 0);
			  VGA_in_green : in std_logic_vector(3 downto 0);
			  VGA_in_blue : in std_logic_vector(3 downto 0);
           col : out  STD_LOGIC_VECTOR (9 downto 0);
           row : out  STD_LOGIC_VECTOR (9 downto 0);
			  VGA_out_red : out std_logic_vector(3 downto 0);
			  VGA_out_green : out std_logic_vector(3 downto 0);
			  VGA_out_blue : out std_logic_vector(3 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC);

end vga_controller;

architecture Behavioral of vga_controller is

	signal Hin, Hactive, HFP, Hsynch, HBP	:	STD_LOGIC_VECTOR (9 downto 0);
	signal Vactive, VFP, Vsynch, VBP  :	STD_LOGIC_VECTOR (9 downto 0);
	
	signal scol : STD_LOGIC_VECTOR (9 downto 0);
	signal srow : STD_LOGIC_VECTOR (9 downto 0);
	
	signal inc_row : std_logic;
	signal erow, ecol : std_logic;
	signal pon : std_logic;

begin

-- Horizontal constants
		-- Durante este tiempo se grafican los pixeles horizontales de una fila639*40ns (Tdisp)
		Hactive <= "1001111111"; -- = 639 -- 640x480 @ 25MHz 
		-- se le suma Tiempo de retrazo inicial Tpf (655-639)*40ns
		    HFP <= "1010001111"; -- = 655 -- 640x480 @ 25MHz 
		-- se le suma el tiempo de ancho de pulso Tpw (751-655)*40ns
		 Hsynch <= "1011101111"; -- = 751 -- 640x480 @ 25MHz 
		-- punto medio de Tpw (se utiliza para incrementar las filas)
			 Hin <= "1010111111"; -- = (655+751)/2 = 703 -- 640x480 @ 25MHz 
		-- se le suma el tiempo de retraso final Tbp (799-751)*40ns. La suma total es igual al tiempo Ts
		    HBP <= "1100011111"; -- = 799 -- 640x480 @ 25MHz 

-- Vertical constants
		-- Durante este tiempo se grafica una fila  (Tdisp)
		Vactive <= "0111011111"; -- = 479 -- 640x480 @ 25MHz
		-- se le suma Tiempo de retrazo inicial Tpf 
		    VFP <= "0111101000"; -- = 488 -- 640x480 @ 25MHz
		-- se le suma el tiempo de ancho de pulso Tpw 
		 Vsynch <= "0111101010"; -- = 490 -- 640x480 @ 25MHz
		-- se le suma el tiempo de retraso final Tbp. La suma total es igual al tiempo Ts
		    VBP <= "1000000111"; -- = 519 -- 640x480 @ 25MHz


counter_cols:	process (clk, reset)
					begin
					   --si el reset esta desactivado se inicializan todos los valores
						if reset = '0' then 
							scol    <= (others => '0');
							srow    <= (others => '0');
							erow 	  <= '0';
							ecol 	  <= '0';
							inc_row <= '0';
							hsync   <= '1';
							vsync   <= '1';
						-- si se recibe un flanco ascendente de la señal de reloj entonces
						elsif clk'event and clk='1' then 
								--si se ya se visualizo todos los pixeles de una fila (640) se reinicializa la cuenta de las columnas 
								--sino se incrementa el valor de la columna (posicion horizontal del pixel)
								if scol = HBP then 
									scol    <= (others => '0');
								else
									scol 	  <= scol + 1;--se incrementa scol
								end if;
							   --se determina el estado del la señal de sincronizacion horizontal. Esta señal pasa a bajo cuando se ha 
								--cumplido el tiempo HFP
								if ((scol <= Hsynch) and (scol >= HFP)) then 
									hsync   <= '0'; 
								else
									hsync   <= '1';
								end if;
								--si se visualizaron todas las filas (480) se reinicializa la cuenta de las filas sino se incrementa la fila a visualizar
								if ((srow >= VBP) and (inc_row = '1')) then 
									srow <= (others => '0');						
								elsif (inc_row = '1') then		
									srow <= srow + 1;
								end if;
								--se determina el estado del la señal de sincronizacion vertical. Esta señal pasa a bajo cuando se ha 
								--cumplido el tiempo VFP
								if ((srow <= Vsynch) and (srow >= VFP)) then --se crea el pulso bajo de la señal Vsync = (VSYNCH-VPF)
									vsync   <= '0';
								else
									vsync   <= '1';
								end if;
								--Si se encuentra durante el tiempo (horizontal) disponible para mostrar pixeles (Tdisp) se habilita
								--la posicion x del pixel a mostrar
								if (scol <= Hactive) then 
									ecol <= '1';
								else
									ecol <= '0';
								end if;
								--Si se encuentra durante el tiempo (vertical) disponible para mostrar pixeles (Tdisp) se habilita
								--la posicion y del pixel a mostrar
								if (srow <= Vactive) then 
									erow <= '1';
								else
									erow <= '0';
								end if;
								--se habilita el incremento de la cuenta de las filas
								if (scol = Hin) then 
									inc_row <= '1';
								else
									inc_row <= '0';
								end if;
								-- se activa la visualizacion del pixel si la fila y la colomna estan habilitadas
								pon <= erow and ecol; 

						end if;
					end process counter_cols;
					

--se "transmiten" las señales (valores) correspondientes a la cuenta de filas y columnas				
row <= srow;
col <= scol;

--Este proceso envia el pixel a mostrar
test1: process (clk, reset)
		 begin
		 
			if reset = '0' then --si reset es 0 las salidas se ponen a 0
			  VGA_out_red   <= (others => '0');
			  VGA_out_green <= (others => '0');
			  VGA_out_blue  <= (others => '0');
			elsif clk'event and clk='1' then -- si en el flanco ascendente del reloj el pixel esta activo se muestra el pixel en pantalla
					if pon = '1' then
						VGA_out_red   <= VGA_in_red;
						VGA_out_green <= VGA_in_green;
						VGA_out_blue  <= VGA_in_blue;
					else								-- sino se muestra la pantalla en negro
						VGA_out_red   <= (others => '0');
						VGA_out_green <= (others => '0');
						VGA_out_blue  <= (others => '0');
					end if;
			end if;
		end process test1;

end Behavioral;

