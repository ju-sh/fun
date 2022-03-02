-- load and en won't have effect in the same clock.
-- load has more precedence.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent_ctr is
  port(
    clk  : in  std_logic;
    en   : in  std_logic;
    load : in  std_logic;
    data : in  std_logic_vector(1 downto 0);
    q    : out std_logic_vector(1 downto 0)
  );
end entity ent_ctr;

architecture arch_ctr of ent_ctr is
  signal nextq : std_logic_vector(1 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if load = '1' then
        nextq <= data;
      elsif en = '1' then
        nextq <= std_logic_vector(to_unsigned((to_integer(unsigned(nextq)) - 1), 2));
      end if;
    end if;
  end process;
  q <= nextq;
end arch_ctr;
