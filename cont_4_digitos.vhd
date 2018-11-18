library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cont_4_digitos is
	port (
		-- ENTRADAS
		valor : in std_logic_vector(15 downto 0);
		enable, load, reset, clock : in std_logic;
		-- SAIDAS
		cont : out std_logic_vector(15 downto 0)
	);
end cont_4_digitos;

architecture arch of cont_4_digitos is
	signal seg : std_logic_vector(15 downto 0);
	signal en_seg : std_logic_vector(3 downto 0);
	signal enable0, enable1, enable2, enable3, parado : std_logic;
begin
	
	parado <= '1' when (seg(15 downto 12) = "0000") 
						and (seg(11 downto 8) = "0000") 
						and (seg(7 downto 4) = "0000") 
						and (seg(3 downto 0) = "0000") 
						else '0';
	--if((seg(15 downto 12) = "0000") and (seg(11 downto 8) = "0000") and (seg(7 downto 4) = "0000") and (seg(3 downto 0) = "0000")) then
	--	parado <= '1';
	--end if;
	
	enable0 <= '1' when parado = '0' and enable = '1' else '0';
	enable1 <= '1' when parado = '0' and seg(3 downto 0) = "0000" else '0';
 	enable2 <= '1' when parado = '0' and seg(7 downto 4) = "0000" and seg(3 downto 0) = "0000" else '0';
	enable3 <= '1' when parado = '0' and seg(11 downto 8) = "0000" and seg(7 downto 4) = "0000" and seg(3 downto 0) = "0000" else '0';

	cont_0 : entity work.cont_dec
				port map(valor => valor(3 downto 0), en => enable0, load => load, reset => reset, clock => clock, cont => seg(3 downto 0) );
	
	cont_1 : entity work.cont_dec
				port map(valor => valor(7 downto 4), en => enable1, load => load, reset => reset, clock => clock, cont => seg(7 downto 4) );
	
	cont_2 : entity work.cont_dec
				port map(valor => valor(11 downto 8), en => enable2, load => load, reset => reset, clock => clock, cont => seg(11 downto 8) );
	
	cont_3 : entity work.cont_dec
				port map(valor => valor(15 downto 12), en => enable3, load => load, reset => reset, clock => clock, cont => seg(15 downto 12) );
				
	cont <= seg(15 downto 12) & seg(11 downto 8) & seg(7 downto 4) & seg(3 downto 0);
end arch;