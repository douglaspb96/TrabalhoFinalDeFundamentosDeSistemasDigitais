library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity relogio_xadrez is
	port (
		-- ENTRADAS
		valor : in std_logic_vector(15 downto 0);
		j1, j2, enable, load, reset, clock : in std_logic;
		-- SAIDAS
		cont1, cont2 : out std_logic_vector(15 downto 0);
		winJ1, winJ2 : out std_logic
	);
end relogio_xadrez;

architecture arch of relogio_xadrez is
	signal valorJ1, valorJ2 : std_logic_vector(15 downto 0);
begin

	-- COMPLETAR A LÓGICA DO XADRES

	cont1 <= valorJ1;
	cont2 <= valorJ2;
	
	winJ1 <= '0';
	winJ2 <= '0' when valorJ1 = x"0" else '1';
	--enable2 <= '1';
	
	process(j1)
	begin
		
	end process;  
	
	
	cronometroJ1 : entity work.cont_4_digitos
						port map(valor => valor, enable => enable, load => load, reset => reset, clock => clock, cont => valorJ1);
						
	cronometroJ2 : entity work.cont_4_digitos
						port map(valor => valor, enable => enable, load => load, reset => reset, clock => clock, cont => valorJ2);
end arch;