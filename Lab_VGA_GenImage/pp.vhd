----------------------------------------------------------------------------------
-- Programa que genera una señal PWM de 4 bits en el puerto pwm_out usando la señal
-- ck como base de tiempo.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pp is
    Port ( ck 		: 	in  STD_LOGIC; 		--Entrada de reloj
           cmpPwm : 	in  STD_LOGIC_VECTOR(9 downto 0); 	--Valor de referencia para la salida
           der: in STD_LOGIC;
			  izq: in STD_LOGIC;
			  cmpPwmJava : in STD_LOGIC_VECTOR(7 downto 0);
			  angle: out STD_LOGIC_VECTOR(7 downto 0); 
			  pwm_out: 	out  STD_LOGIC	--Salida pwm
			
			 );
end pp;

architecture Behavioral of pp is

-- Señal para controlar el valor del contador de control del módulo PWM de 4 bits
-- La frecuencia base del módulo pwm es igual a ck*2^4
signal cntPwm: std_logic_vector(10 downto 0);
--CONSTANT c: std_logic_vector(5 downto 0):= "111100"; 
signal  estado: STD_LOGIC :='1';
signal angulo: std_logic_vector(7 downto 0):="00000000";

begin

--	CambioAngulo: process(cmpPwm)
--		begin
--			actual <= '0' & signed(cmpPwm); --Se actualiza el estado actual
--				
--			if anterior = inicio then
--					anterior <= actual;
--			end if;
--				
--			if (actual-anterior)>=4 then
--				
--					anterior<=actual;
--					if angulo < 180 then
--						angulo <= angulo + '1';
--					end if;
--			end if;
--				
--			if (anterior-actual)>= 4	then
--					anterior<=actual;
--					if angulo>0 then
--						angulo <= angulo - '1';
--					end if;
--
--			end if;
--		end process;
--	estado1: process(click_derecho)
--		begin
--			if click_derecho = '1' then
--				estado <= '0';
--			end if;
--
--end process;
		
	cambioEstado: process(izq,der)
		begin		
			if der = '1' then
	estado <= '0';
	end if;

		
			if izq = '1' then
				estado <= '1';
			end if;
		end process;
	
	PwmCounter: process(ck)
		begin
			
			if estado = '1' then
			
				if ck'event and ck='1' then
					cntPwm <= cntPwm + '1'; --Se incrementa el valor del contador PWM
					if cntPwm = "11111010000" then
							cntPwm <= "00000000000";
					end if;
				
					if cntPwm <= (cmpPwm(9 downto 2) + 60) then
								pwm_out <= '1';
					else
								pwm_out <= '0';
					end  if;
				
			
				end if;
				
				angle <= cmpPwm(9 downto 2)+ '1';
				else
				if ck'event and ck='1' then
					cntPwm <= cntPwm + '1'; --Se incrementa el valor del contador PWM
					if cntPwm = "11111010000" then
							cntPwm <= "00000000000";
					end if;
				
					if cntPwm <= (cmpPwmJava + 60) then
								pwm_out <= '1';
					else
								pwm_out <= '0';
					end  if;
				
				angle <=cmpPwmJava + '1';
				
				end if;
				
				end if;
		end process;

end Behavioral;


