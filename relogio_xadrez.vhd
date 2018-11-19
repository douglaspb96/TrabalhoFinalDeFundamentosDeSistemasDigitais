library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity relogio_xadrez is
	port (
		-- ENTRADAS
		valor : in std_logic_vector(15 downto 0);
		j1, j2, load, reset, clock : in std_logic;
		-- SAIDAS
		cont1, cont2 : out std_logic_vector(15 downto 0);
		winJ1, winJ2 : out std_logic := '0'
	);
end relogio_xadrez;

architecture arch of relogio_xadrez is
	signal valorJ1, valorJ2 : std_logic_vector(15 downto 0);
	signal enable1, enable2 : std_logic := '0';
begin
	cont1 <= valorJ1;
	cont2 <= valorJ2;
	
	process(clock)
	begin
		if(rising_edge(clock)) then
			-- DEFINE QUEM JOGA
			if(j1 = '1') then
				enable1 <= not(enable1);
				enable2 <= enable1;
			elsif(j2 = '1') then
				enable1 <= enable2;
				enable2 <= not(enable2);
			end if;
			
			-- DEFINE SE O JOGADOR 1 GANHOU
			if(valorJ1 > x"0000" and valorJ2 = x"0000") then
				winJ1 <= '1';
				enable1 <= '0';
				enable2 <= '0';		
			-- DEFINE SE O JOGADOR 2 GANHOU
			elsif(valorJ1 = x"0000" and valorJ2 > x"0000") then
				winJ2 <= '1';
				enable1 <= '0';
				enable2 <= '0';
			else 
				winJ1 <= '0';
				winJ2 <= '0';
			end if;
			
		end if;
	end process;  
	
	cronometroJ1 : entity work.cont_4_digitos
						port map(valor => valor, enable => enable1, load => load, reset => reset, clock => clock, cont => valorJ1);
						
	cronometroJ2 : entity work.cont_4_digitos
						port map(valor => valor, enable => enable2, load => load, reset => reset, clock => clock, cont => valorJ2);
end arch;