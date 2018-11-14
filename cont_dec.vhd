library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cont_dec is
	port (
		-- ENTRADAS
		en, load, reset, clock : in std_logic;
		valor : in std_logic_vector(3 downto 0);
		-- SAIDAS
		cont : out std_logic_vector(3 downto 0)
	);
end cont_dec;

architecture arch of cont_dec is
	signal contAux : std_logic_vector(3 downto 0);
begin
	-- TESTAR
	cont <= contAux;
	
	process(clock, reset)
	begin
		if(reset = '1') then	
			contAux <= (others=>'0'); -- EM HEXA (PARA SER EM BINARIO, COLOCAR SEM O "x")
		elsif rising_edge(clock) then -- NA BORDA DE CLOCK
			if(load = '1') then 
				contAux <= valor;
			elsif(en = '1') then
				if(contAux = "0000") then
					contAux <= "1001";
				else 
					contAux <= contAux - 1;
				end if;
			end if;
		end if;
	end process;   
	
end arch;
