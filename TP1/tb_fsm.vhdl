library ieee;
use ieee.std_logic_1164.all;

entity tb_fsm is
end tb_fsm;

architecture tb_fsm_arq of tb_fsm is

    component fsm is
		port (
		    rst : in std_logic;
            clk : in std_logic;
            -- SEMAFORO 1 
            r1: out std_logic;
            a1: out std_logic;
            v1: out std_logic;
            -- SEMAFORO 2
            r2: out std_logic;
            a2: out std_logic;        
            v2: out std_logic
		);
	end component; 
    
    signal tb_clk               : std_logic := '0';
    signal tb_rst               : std_logic;
    signal tb_r1                :  std_logic := '0';
    signal tb_r2                :  std_logic := '1';
    signal tb_v1                :  std_logic := '1';        
    signal tb_v2                :  std_logic := '0';
    signal tb_a1                :  std_logic := '0';
    signal tb_a2                :  std_logic := '0';

    begin
        tb_rst <= '1', '0' after 1 ns;
        tb_clk <= not tb_clk after 0.10 ns;
        
    DUT: fsm
        port map(
            rst                 => tb_rst,
            clk                 => tb_clk,
            r1                  => tb_r1,
            r2                  => tb_r2,
            v1                  => tb_v1,
            v2                  => tb_v2,
            a1                  => tb_a1,
            a2                  => tb_a2
    );

end tb_fsm_arq; 