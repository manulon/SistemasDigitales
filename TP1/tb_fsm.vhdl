library ieee;
use ieee.std_logic_1164.all;

entity tb_fsm is
end tb_fsm;

architecture behavioral of tb_fsm is
    constant SIM_TIME_NS: time := 200 ns;
    constant TB_N3 : natural := 28;
    constant TB_N30: natural := 4;

    signal tb_rst               :  std_logic := '1';
    signal tb_clk               :  std_logic := '0';
    signal tb_tres_segundos     :  std_logic := '0';
    signal tb_treinta_segundos  :  std_logic := '0';
    signal tb_r1                :  std_logic := '0';
    signal tb_r2                :  std_logic := '1';
    signal tb_v1                :  std_logic := '1';        
    signal tb_v2                :  std_logic := '0';
    signal tb_a1                :  std_logic := '0';
    signal tb_a2                :  std_logic := '0';

    begin
        tb_clk <= not tb_clk after 10 ns;
        tb_rst <= '0', '1' after 7 ns, '0' after 8 ns;
        tb_tres_segundos    <= '1' after 15 ns;
        tb_treinta_segundos <= '1' after 15 ns;

        stop_simulation: process
    begin
        wait for SIM_TIME_NS;--run the simulation for this duration
        assert false
        report "Simulation finished."
        severity failure;
    end process;

    I1: entity work.fsm(behavioral)
    port map(

        rst                 => tb_rst,
        clk                 => tb_clk,
        tres_segundos       => tb_tres_segundos,
        treinta_segundos    => tb_treinta_segundos,
        r1                  => tb_r1,
        r2                  => tb_r2,
        v1                  => tb_v1,
        v2                  => tb_v2,
        a1                  => tb_a1,
        a2                  => tb_a2
    );
    end behavioral;




    