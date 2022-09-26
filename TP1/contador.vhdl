library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
    generic (
        N1 : natural := 5;
        N30 : natural := 26
    );
    port(
        rst : in std_logic;
        clk : in std_logic;
        un_segundo  : out std_logic;
        treinta_segundos : out std_logic;
        cuenta_1 : out std_logic_vector(N1-1 downto 0);
        cuenta_30 : out std_logic_vector(N30-1 downto 0)
    );
end contador;

architecture behavioral of contador is
    signal aux_cuenta_1  : unsigned(N1-1 downto 0);
    signal aux_cuenta_30 : unsigned(N30-1 downto 0);
    signal aux_un_segundo:  std_logic;
    signal aux_treinta_segundos:  std_logic;
begin

    process(clk, rst) is
    begin
        if rst = '1' then
            aux_cuenta_1 <= (others => '0');
        elsif clk = '1' and clk'event then
            if aux_cuenta_1 = 49999 then
                aux_cuenta_1 <= (others => '0');
                aux_un_segundo <= '1';
            else
                aux_cuenta_1 <= aux_cuenta_1 + 1;
            end if;
        end if;
    end process;

    cuenta_1 <= std_logic_vector(aux_cuenta_1);

    process(clk, rst) is
    begin
        if rst = '1' then
            aux_cuenta_30 <= (others => '0');
        elsif clk = '1' and clk'event then
            if aux_un_segundo = '1' then
                if aux_cuenta_30 = 29 then
                    aux_cuenta_30 <= (others => '0');
                    aux_treinta_segundos <= '1';
                else
                    aux_cuenta_30 <= aux_cuenta_30 + 1;
                end if;
            end if;
        end if;
    end process;

        cuenta_30        <= std_logic_vector(aux_cuenta_30);
        un_segundo       <= '1';
        treinta_segundos <= '1';

end behavioral;