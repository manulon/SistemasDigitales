library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    generic(
        N3 : natural := 28;
        N30 : natural := 4
	);
    port(
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
end fsm;

architecture fsm_arq of fsm is
    
    component contador is
		generic(
            N3 : natural := 28;
            N30 : natural := 4
		);
		port(
			rst : in std_logic;
            clk : in std_logic;
            tres_segundos  : out std_logic;
            treinta_segundos : out std_logic
		);
	end component;

    type t_state is (S0, S1, S2, S3, S4, S5);
    signal state : t_state;
    signal aux_inicial:  std_logic := '1';

    signal aux_3_segundos : std_logic;
	signal aux_30_segundos: std_logic;

begin

    contador_inst: contador
        generic map(
            N3  => N3,
            N30 => N30
        )
        port map(
            rst                 => rst,
            clk                 => clk,
            tres_segundos       => aux_3_segundos,
            treinta_segundos    => aux_30_segundos
        );

    process(clk,rst)
    begin
        if rst='1' then
            state <= S0;
        elsif clk = '1' and clk'event then
            case state is
                when S0 =>
                    if aux_30_segundos = '1' then
                        state <= S1;
                    end if;
                when S1 =>
                    if aux_3_segundos = '1' then
                        state <= S2;
                    end if;
                when S2 =>
                    if aux_3_segundos = '1' then
                        state <= S3;
                    end if;
                when S3 =>
                    if aux_30_segundos = '1' then
                        state <= S4;
                    end if;
                when S4 =>
                    if aux_3_segundos = '1' then
                        state <= S5;                   
                    end if;
                when S5 =>
                    if aux_3_segundos = '1' then
                        state <= S0;
                    end if;
            end case;
        end if;
    end process;

    r1 <= '1' when (state = S2 or state = S3 or state = S4 ) else '0';
    r2 <= '1' when (state = S0 or state = S1 or state = S5 ) else '0';
    a1 <= '1' when (state = S1 or state = S5) else '0';
    a2 <= '1' when (state = S2 or state = S4) else '0';
    v1 <= '1' when (state = S0) else '0';
    v2 <= '1' when (state = S3) else '0';

end fsm_arq;