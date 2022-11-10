library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplicador is
end tb_multiplicador;

architecture tb_multiplicador_arq of tb_multiplicador is
    
    component multiplicador is
		port (
			clk : in std_logic;
            test_a: out std_logic_vector(19-1 downto 0);
            test_b: out std_logic_vector(19-1 downto 0);
            resultado: out std_logic_vector(19-1 downto 0);
            exponente_final: out std_logic_vector(6-1 downto 0);
            mantisa_final:   out std_logic_vector(12-1 downto 0);
            test_exponente_a:     out std_logic_vector(6-1 downto 0);
            test_exponente_b:     out std_logic_vector(6-1 downto 0)
		);
	end component;
    
        -- resultado  : out unsigned(N-1 downto 0)

        signal tb_clk: std_logic := '0';
        signal tb_test_a: std_logic_vector(19-1 downto 0);
        signal tb_test_b: std_logic_vector(19-1 downto 0);
        signal tb_resultado: std_logic_vector(19-1 downto 0);
        signal tb_exponente_final: std_logic_vector(6-1 downto 0);
        signal tb_mantisa_final:   std_logic_vector(12-1 downto 0);
        signal tb_test_exponente_a:        std_logic_vector(6-1 downto 0);
        signal tb_test_exponente_b:        std_logic_vector(6-1 downto 0);

    begin
        tb_clk <= not tb_clk after 0.10 ns;

    DUT: multiplicador
        port map(
            clk              => tb_clk,
            test_a           => tb_test_a,
            test_b           => tb_test_b,
            resultado        => tb_resultado,
            exponente_final  => tb_exponente_final,
            test_exponente_a => tb_test_exponente_a,
            test_exponente_b => tb_test_exponente_b,                    
            mantisa_final    => tb_mantisa_final            
    );

    
end tb_multiplicador_arq; 