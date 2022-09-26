library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port(
        rst : in std_logic;
        clk : in std_logic;
        1s : in std_logic;
        30s : in std_logic;
        r1: out std_logic;
        r2: out std_logic;
        v1: out std_logic;        
        v2: out std_logic;
        a1: out std_logic;
        a2: out std_logic;
    );
end fsm;

architecture behavioral of fsm is
    
    type t_state is (S0, S1, S2, S3, S4, S5, S6);
    signal state : t_state;

begin
    process(clk,rst)
    begin
        if rst='1' then
            state <= S0;
        elsif clk = '1' and clk'event then
            case state is
                when S0 =>
                    if 30s = '1' then
                        state <= S1;
                    end if;
                when S1 =>
                    if 1s = '1' then
                        state <= S2;
                    end if;
                when S2 =>
                    if 1s = '1' then
                        state <= S3;
                    end if;
                when S3 =>
                    if 30s = '1' then
                        state <= S4;
                    end if;
                when S4 =>
                    if 1s = '1' then
                        state <= S5;                   
                    end if;
                when S5 =>
                    if 1s = '1' then
                        state <= S6;
                    end if;
                when S6 =>
                    if 30s = '1' then
                        state <= S0;
                    end if;
            end case;
        end if;
    end process;
    r1 <= '1' when (state = S2 or state = S3 or state = S4 or state = S5) else '0';
    r2 <= '1' when (state = S0 or state = S1 or state = S5 or state = S6) else '0';
    a1 <= '1' when (state = S1 or state = S6) else '0';
    a2 <= '1' when (state = S2 or state = S4) else '0';
    v1 <= '1' when (state = S0) else '0';
    v2 <= '1' when (state = S3) else '0';
end behavioral;