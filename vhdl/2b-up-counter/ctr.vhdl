library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.numeric_bit_unsigned.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;

entity counter is
port(
    clk: in std_logic;
    reset: in std_logic;
    enable: in std_logic;
    q: out std_logic_vector(1 downto 0)
);
end counter;

architecture counter_arch of counter is
    signal preq : std_logic_vector(1 downto 0);
begin
    process(clk, enable, reset)
        variable curq: Integer;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                preq <= "00";
            elsif enable = '1' then
                if preq = "11" then
                    preq <= "00";
                else
                    preq <= std_logic_vector(to_unsigned((to_integer(unsigned(preq)) + 1), 2));
                end if;
            end if;
        end if;
    end process;

    q <= preq;
end counter_arch;
