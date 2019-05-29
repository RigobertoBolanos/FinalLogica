----------------------------------------------------------------------------------
-- File Name: reader.vhd
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity reader is
    Port ( clk,reset:in STD_LOGIC;
			  row : in  STD_LOGIC_VECTOR (9 downto 0);
           col : in  STD_LOGIC_VECTOR (9 downto 0);
           addr : out  STD_LOGIC_VECTOR (13 downto 0);
			  datain : in  STD_LOGIC_VECTOR (2 downto 0);
			  R, G, B : out  STD_LOGIC;
			  mouse : in STD_LOGIC
			  );
end reader;

architecture Behavioral of reader is
   --posiciones P(x,y)para graficar la imagen centrada en la pantalla
	--Tamaño imagen: 224x224
	
         --  P1__________________P2			*---------> X	
			--  |							|			|
			--  |							|			|
			--  |							|			| SISTEMA DE COORDENADAS
			--  |		  IMAGEN			|			|
			--  |							|			V
			--  |							|			Y
			--  P3__________________P4
			
	--Imagen 1: (IMAGEN ORIGINAL) 
	--		P1=(208,128)
	--		P2=(431,128)
	--		P3=(208,351)
	--		P4=(431,351)
		
	constant xtop : integer := 0;
	constant ytop_min : integer := 418;
	constant xbottom : integer := 48;
	constant ybottom_min : integer := 478;
	
	
	--constantes para el maximo valor del salto
	constant ytop_max : integer := 100;
	constant ybottom_max : integer := 160;
	
	
	-- Finales de pixel de cada frame
	constant final_izq_0 : STD_LOGIC_VECTOR (13 downto 0) := "00101110101100"; -- 2988
	constant final_der_1 : STD_LOGIC_VECTOR (13 downto 0) := "01011101011001"; -- 5928

	-- Delay cambio imagen
	constant t_MaxEspera : integer := 10;
	
	--Direcciones imagen en memoria
	signal addr_normal : STD_LOGIC_VECTOR (13 downto 0) := (others => '0');
	
begin
	
	c_normal: process (clk, reset)
	--habilita la visualizacion de la imagen
	variable en_img : std_logic:= '0';
	variable transicion : integer := 0;
	variable t_espera : integer := 0;
	variable t_salto : integer := 0;
	
	-- variables para el movimiento 
	variable ytop : integer := ytop_min;
	variable ybottom : integer := ybottom_min;
	
	-- variable de control del salto 
	variable jump : std_logic := '0' ;
	
	begin
	
			if reset = '0' then
				addr_normal <= (others => '0');
				en_img:='0';
				jump := '0';
				ytop := ytop_min;
				ybottom := ybottom_min;
				t_salto := 0;
				
			elsif
			clk'event and clk='1' then
			--si el controlador esta mostrando los pixeles ubicados dentro del marco de la imagen en la pantalla
			--entonces se lee la informacion de color almacenada en la memoria. Caso contrario pinta el pixel de color
			--negro
			
				
					
						
				if (row >= ytop) and (row <= ybottom) then
					if (col >= xtop) and (col <= xbottom) then
						en_img:='1';
						
						if addr_normal = final_izq_0 and transicion = 0 then
							addr_normal <= (others => '0');
							t_espera := t_espera +1;
								if t_espera = t_MaxEspera then
									t_espera :=0;
									addr_normal <= final_izq_0+1;
									transicion :=1;
								end if;
						elsif addr_normal = final_der_1 and transicion = 1 then
							addr_normal <= final_izq_0+1;
							t_espera := t_espera +1;
							if t_espera = t_MaxEspera then
									t_espera :=0;
									addr_normal <= (others => '0');
									transicion :=0;
							end if;
						else
							addr_normal <= addr_normal + 1;
						end if;
					else
						en_img:='0';
					end if;
				end if;
			 if(en_img='1') then
			 
				R<=datain(2);
				G<=datain(1);
				B<=datain(0);
			 else
				R<='1';
				G<='1';
				B<='1';
			end if; 
			
				if mouse ='1' and  jump = '0' then
						jump := '1';
					end if;
					
					if jump = '1' then
							if ytop > ytop_max then
									t_salto := t_salto +1;
									
									if  t_salto = 200000 then
										ytop := ytop -1;
										ybottom := ytop+60;
										t_salto := 0;	
										
									end if;
									
							end if;
								
							if ytop = ytop_max then
										jump := '0';
							end if;

							
					elsif jump = '0' then
							if ytop < ytop_min  then
							t_salto := t_salto +1;
									if  t_salto = 200000 then
										ytop := ytop +1;
										ybottom := ytop + 60;
										t_salto := 0;
									end if;
							end if;
					end if;
					 
			end if;
			
	end process c_normal;

	
	addr <= addr_normal; 

end Behavioral;
