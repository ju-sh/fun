library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;


entity count_ent is
  port (
    clk : in std_logic;
    load : in std_logic;
    reset : in std_logic;
    enable : in std_logic;
    d : in std_logic_vector (7 downto 0);
    q : out std_logic_vector (7 downto 0));  -- counter output
end count_ent;

architecture count_arch of count_ent is
  signal res : std_logic_vector (7 downto 0); 
begin
  process (clk, reset)
  begin
    if reset = '1' then
      res <= (others => '0');
    elsif rising_edge(clk) then
      if load = '1' then
        res <= d;
      elsif enable = '1' then
        -- and load = '0'
        res <= std_logic_vector(unsigned(q) + 1);
      else
        res <= q;
      end if;
    end if;
    q <= res;
  end process;
end count_arch;
