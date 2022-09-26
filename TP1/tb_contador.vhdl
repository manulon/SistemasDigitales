library ieee;
use ieee.std_logic_1164.all;

entity tb_contador is
end tb_contador;

architecture behavioral of tb_contador is
    constant SIM_TIME_NS: time := 200 ns;
    constant TB_N1 : natural := 5;
    constant TB_N30: natural := 26;

    signal tb_clk               : std_logic := '0';
    signal tb_rst               : std_logic;
    signal tb_un_segundo        : std_logic;    
    signal tb_treinta_segundos  : std_logic;
    signal tb_cuenta_1          : std_logic_vector(TB_N1-1 downto 0);
    signal tb_cuenta_30         : std_logic_vector(TB_N30-1 downto 0);

    begin
        tb_rst <= '0', '1' after 30 ns, '0' after 50 ns;
        tb_clk <= not tb_clk after 5 ns;

        stop_simulation: process
    begin
        wait for SIM_TIME_NS;--run the simulation for this duration
        assert false
        report "Simulation finished."
        severity failure;
    end process;

    I1: entity work.contador(behavioral)
    generic map(
        N1 => TB_N1,
        N30 => TB_N30
    )
    port map(
        rst                 => tb_rst,
        clk                 => tb_clk,
        un_segundo          => tb_un_segundo,
        treinta_segundos    => tb_treinta_segundos,
        cuenta_1            => tb_cuenta_1,
        cuenta_30           => tb_cuenta_30   
    );
    end behavioral;




    