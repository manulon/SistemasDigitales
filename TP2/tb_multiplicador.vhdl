library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplicador is
end tb_multiplicador;

architecture tb_multiplicador_arq of tb_multiplicador is
    
    component multiplicador is
		port (
			clk : in std_logic;
            test_a: out std_logic_vector(23-1 downto 0);
            test_b: out std_logic_vector(23-1 downto 0);
            resultado_vector: out std_logic_vector(23-1 downto 0)
		);
	end component;
    
        -- resultado  : out unsigned(N-1 downto 0)

        signal tb_clk: std_logic := '0';
        signal tb_test_a: std_logic_vector(23-1 downto 0);
        signal tb_test_b: std_logic_vector(23-1 downto 0);
        signal tb_resultado_vector: std_logic_vector(23-1 downto 0);
  
    begin
        tb_clk <= not tb_clk after 0.10 ns;

    DUT: multiplicador
        port map(
            clk              => tb_clk,
            test_a           => tb_test_a,
            test_b           => tb_test_b,
            resultado_vector => tb_resultado_vector
    );

    
end tb_multiplicador_arq; 