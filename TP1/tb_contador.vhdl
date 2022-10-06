library ieee;
use ieee.std_logic_1164.all;

entity tb_contador is
end tb_contador;

architecture tb_contador_arq of tb_contador is
    
    component contador is
		port (
			rst : in std_logic;
            clk : in std_logic;
            tres_segundos  : out std_logic;
            treinta_segundos : out std_logic
		);
	end component;
    
    signal tb_clk               : std_logic := '0';
    signal tb_rst               : std_logic;
    signal tb_tres_segundos     : std_logic := '0';    
    signal tb_treinta_segundos  : std_logic := '0';
  
    begin
        tb_rst <= '1', '0' after 1 ns;
        tb_clk <= not tb_clk after 0.10 ns;

    DUT: contador
        port map(
            rst                 => tb_rst,
            clk                 => tb_clk,
            tres_segundos       => tb_tres_segundos,
            treinta_segundos    => tb_treinta_segundos 
    );

    
end tb_contador_arq; 