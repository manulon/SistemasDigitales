library IEEE;
use IEEE.std_logic_1164.all;

entity contador is
    generic (
        N1 : natural := 5
        N30 : natural := 26
    );
    port(
        rst : in std_logic;
        clk : in std_logic;
        1s  : in std_logic;
        30s : in std_logic;
        cuenta_1 : out std_logic_vector(N-1 downto 0)
        cuenta_30 : out std_logic_vector(N-1 downto 0)
    );
end contador;

architecture behavioral of contador is
    signal aux_cuenta_1 : unsigned(N1-1 downto 0);
    signal aux_cuenta_30 : unsigned(N30-1 downto 0);
begin

    process(clk, rst) is
    begin
        if rst = '1' then
            aux_cuenta_1 <= (others => '0')
        elsif clk = '1' and clk'event then
            if aux_cuenta_1 = 49999 then
                aux_cuenta_1 <= (others => '0')
                1s <= '1';
            else
                aux_cuenta_1 <= cuenta1 + 1
            end if;
        end if;
    end process;

    cuenta_1 <= std_logic_vector(aux_cuenta_1);

    process(clk, rst) is
        begin
            if rst = '1' then
                aux_cuenta_30 <= (others => '0')
            elsif clk = '1' and clk'event then
                if 1s = '1' then
                    if aux_cuenta_30 = 29 then
                        aux_cuenta_30 <= (others => '0')
                        30s <= '1';
                    else
                        aux_cuenta_30 <= cuenta30 + 1
                    end if;
                end if;
            end if;
        end process;

        cuenta_30 <= std_logic_vector(aux_cuenta_30);

end behavioral;