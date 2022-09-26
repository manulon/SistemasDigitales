library ieee;
use ieee.std_logic_1164.all;

entity tb_counter is
end tb_counter;

architecture behavioral of tb_counter is
    constant SIM_TIME_NS: time := 200ns;
    constant TB_N: natural := 4;

    signal tb_clk: std_logic := '0';
    signal tb_rst: std_logic;
    signal tb_count: std_logic_vector(TB_N-1 downto 0);

    begin
        tb_rst <= '0', '1' after 30ns, '0' after 50ns;
        tb_clk <= not tb_clk after 5ns;

        stop_simulation: process
    begin
        wait for SIM_TIME_NS;--run the simulation for this duration
        assert false
        report "Simulation finished."
        severity failure;
    end process;

    I1: entity work.counter(behavioral)
    generic map(
        N => TB_N
    )
    port map(
        rst => tb_rst,
        clk => tb_clk,
        count => tb_count
    );
    end behavioral
