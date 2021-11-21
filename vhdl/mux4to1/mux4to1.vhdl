-- 4:1 MUX
-- 4 input signals to choose from
--
-- ghdl analyze % or ghdl -a 5
-- ghdl elaborate <entity-name> or ghdl -e <entity-name>
-- ghdl -r <entity-name>

library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
  port(
    a, b, c, d : in std_logic;  -- input lines
    s1, s0 : in std_logic;
--    s : in std_logic_vector(1 downto 0);  -- select lines
    o : out std_logic  -- output line
  );
end mux4to1;

architecture mux4to1_arch of mux4to1 is
begin
  process (a, b, c, d, s0, s1) is
  begin
    if s1='0' and s0='0' then
      o <= a;
    elsif s1='0' and s0='1' then
      o <= b;
    elsif s1='1' and s0='1' then
      o <= c;
    else
      o <= d;
    end if;
  end process;
--   case s is
--     when '00' =>
--       o <= a;
--     when '01' =>
--       o <= b;
--     when '10' =>
--       o <= c;
--     when '11' =>
--       o <= d;
--   end case;
end mux4to1_arch;
