library IEEE;
use IEEE.std_logic_1164.all;

entity cont_dec is
	port (
		-- ENTRADAS
		value : in std_logic_vector(3 downto 0);
		en, load, reset, clock : in std_logic;
		-- SAIDAS
		cont : out std_logic_vector(3 downto 0);
	);
end cont_dec;

architecture arch of cont_dec is
	signal contAux : std_logic_vector(3 downto 0);
begin
	-- TESTAR
	cont <= contAux;
	
	cont_d : process(clock, reset)
		begin
			if reset = '1' then	
				contAux <= "0000";
			elsif clock'event and clock = '1' then
				if load = '1' then 
					contAux <= value;
				else 
					if en = '1' then
						if contAux = '0' then
							contAux <= "1001"
						else 
							contAux <= contAux - 1;
					end if;
				end if;
			end if;
		end process cont_d;   
	
end arch;