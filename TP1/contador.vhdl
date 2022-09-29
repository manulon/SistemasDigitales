library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
    generic (
        N3 : natural := 28;
        N30 : natural := 4
    );
    port(
        rst : in std_logic;
        clk : in std_logic;
        tres_segundos  : out std_logic;
        treinta_segundos : out std_logic;
        cuenta_3 : out std_logic_vector(N3-1 downto 0);
        cuenta_30 : out std_logic_vector(N30-1 downto 0)
    );
end contador;

architecture behavioral of contador is
    signal aux_cuenta_3  : unsigned(N3-1 downto 0);
    signal aux_cuenta_30 : unsigned(N30-1 downto 0);
    signal aux_tres_segundos:  std_logic := '0';
    signal aux_treinta_segundos:  std_logic := '0';
begin
    process(clk, rst) is
        begin
            if rst = '1' then
                aux_cuenta_3 <= (others => '0');
            elsif clk = '1' and clk'event then
                if aux_tres_segundos = '1' then
                    aux_tres_segundos <= '0';
                end if;
                if aux_cuenta_3 = 40 then
                    aux_cuenta_3 <= (others => '0');
                    aux_tres_segundos <= '1';
                else
                    aux_cuenta_3 <= aux_cuenta_3 + 1;
                end if;
            end if;
        end process;

        process(clk, rst) is
            begin
                if rst = '1' then
                    aux_cuenta_30 <= (others => '0');
                elsif clk = '1' and clk'event then
                    if aux_treinta_segundos = '1' then
                        aux_treinta_segundos <= '0';
                    end if;
                    if aux_tres_segundos = '1' then
                        if aux_cuenta_30 = 9 then
                            aux_cuenta_30 <= (others => '0');
                            aux_treinta_segundos <= '1';
                        else
                            aux_cuenta_30 <= aux_cuenta_30 + 1;
                        end if;
                    end if;
                end if;
            end process;

        cuenta_3         <= std_logic_vector(aux_cuenta_3);
        cuenta_30        <= std_logic_vector(aux_cuenta_30);
        tres_segundos    <= aux_tres_segundos;
        treinta_segundos <= aux_treinta_segundos;

end behavioral;