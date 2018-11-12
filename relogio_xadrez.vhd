library IEEE;
use IEEE.std_logic_1164.all;

entity relogio_xadrez is
	port (
		-- ENTRADAS
		value : in std_logic_vector(15 downto 0);
		j1, j2, load, reset, clock : in std_logic;
		-- SAIDAS
		cont1, cont2 : out std_logic_vector(15 downto 0);
		winJ1, winJ2 : out std_logic;
	);
end relogio_xadrez;

architecture arch of relogio_xadrez is
begin
	-- COMPLETAR AQUI COM A LOGICA DO JOGO
end arch;