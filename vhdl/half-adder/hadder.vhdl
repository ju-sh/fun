library ieee;
use ieee.std_logic_1164.all;

entity hadder is
  port(
    a: in std_logic;
    b: in std_logic;
    s: out std_logic;
    c: out std_logic
  );
end hadder;

architecture arch_hadder of hadder is
begin
    s <= a xor b;
    c <= a and b;
end arch_hadder;
