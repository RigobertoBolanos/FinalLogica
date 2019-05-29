--carga de librerias
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clk_div_25MHz is
    Port ( clk 		: in 		 STD_LOGIC;						-- señal de reloj del sistema (50Mhz)
			  clk_25MHz : out     STD_LOGIC); 	-- salida de reloj de 25Mhz
end Clk_div_25MHz;


architecture Behavioral of Clk_div_25MHz is

signal clk_25     : STD_LOGIC; --señal interna de reloj de 25Mhz
begin

--proceso para generar una señal de reloj de 25MHz a partir de la señal de reloj del sistema (50Mhz)				  
process (clk)
begin
	if RISING_EDGE (clk) then
		clk_25 <= not (clk_25);
	end if;
end process;

	clk_25MHz <= clk_25;
end Behavioral;

