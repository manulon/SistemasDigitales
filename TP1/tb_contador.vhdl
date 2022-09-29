library ieee;
use ieee.std_logic_1164.all;

entity tb_contador is
end tb_contador;

architecture behavioral of tb_contador is
    constant SIM_TIME_NS: time := 200 ns;
    constant TB_N3 : natural := 28;
    constant TB_N30: natural := 4;

    signal tb_clk               : std_logic := '0';
    signal tb_rst               : std_logic;
    signal tb_tres_segundos     : std_logic := '0';    
    signal tb_treinta_segundos  : std_logic := '0';
    signal tb_cuenta_3          : std_logic_vector(TB_N3-1 downto 0);
    signal tb_cuenta_30         : std_logic_vector(TB_N30-1 downto 0);

    begin
        tb_rst <= '0', '1' after 30 ns, '0' after 50 ns;
        tb_clk <= not tb_clk after 0.15 ns;

        stop_simulation: process
    begin
        wait for SIM_TIME_NS;--run the simulation for this duration
        assert false
        report "Simulation finished."
        severity failure;
    end process;

    I1: entity work.contador(behavioral)
    generic map(
        N3 => TB_N3,
        N30 => TB_N30
    )
    port map(
        rst                 => tb_rst,
        clk                 => tb_clk,
        tres_segundos       => tb_tres_segundos,
        treinta_segundos    => tb_treinta_segundos,
        cuenta_3            => tb_cuenta_3,
        cuenta_30           => tb_cuenta_30   
    );
    end behavioral;




    