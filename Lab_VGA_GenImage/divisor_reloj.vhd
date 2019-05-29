----------------------------------------------------------------------------------
-- Componente divisor_reloj
-- Permite obtener una base de tiempo a partir de una señal de reloj de 25MHz
-- Por defecto genera una señal de frecuencia 95.367Hz (10.48ms de periodo)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity divisor_reloj is
    Port ( clk : in  STD_LOGIC; -- Señal de reloj de entrada
           clk_div : out  STD_LOGIC -- Señal de reloj de salida
			  );
end divisor_reloj;

architecture Behavioral of divisor_reloj is

signal inc_cuenta : STD_LOGIC_VECTOR (6 downto 0):="0000000"; --Permite contar hasta 125 pulsos
signal clk_out : STD_LOGIC:='0'; --Señal que almacena el cambio de estado de la salida clk_div

begin

-- Cuando ocurra un flanco ascendente en el bit 19 del vector (cada 41.94ms con un reloj de 25MHz) se cambiara 
-- el estado de la señal clk_div.
-- El valor configurado permite obtener una señal de reloj de 11.92Hz (base de tiempo de 83.886 ms)

process (clk)
	begin
		if RISING_EDGE (clk) then
			inc_cuenta <= inc_cuenta + 1;
		
		if inc_cuenta >= "1111101" then
			clk_out <= not (clk_out);
			inc_cuenta <= "0000000";
		end if;
		end if;
		clk_div<=clk_out;
	
end process;

end Behavioral;




