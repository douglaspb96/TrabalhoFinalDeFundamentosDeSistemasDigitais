library IEEE;
use IEEE.std_logic_1164.all;

entity cont_4_digitos is
	port (
		-- ENTRADAS
		value : in std_logic_vector(15 downto 0);
		enable, load, reset, clock : in std_logic;
		-- SAIDAS
		cont : out std_logic_vector(15 downto 0);
	);
end cont_4_digitos;

architecture arch of cont_4_digitos is
begin
	-- ARRUMAR OS PORT MAPS, SÓ DEIXEI OS VALUES "CERTOS" PARA SABER
	
	cont_0 : entity work.cont_dec
				port map(value => value(3 downto 0), en => enable, load => LOAD, reset => RESET, clock => CLOCK );
	
	cont_1 : entity work.cont_dec
				port map(value => value(7 downto 4), en => enable, load => LOAD, reset => RESET, clock => CLOCK );
	
	cont_2 : entity work.cont_dec
				port map(value => value(11 downto 8), en => enable, load => LOAD, reset => RESET, clock => CLOCK );
	
	cont_3 : entity work.cont_dec
				port map(value => value(15 downto 12), en => enable, load => LOAD, reset => RESET, clock => CLOCK );
				
	-- COMPLETAR COM A LOGICA DO CONTADOR DECIMAL DE 4 DIGITOS
end arch;