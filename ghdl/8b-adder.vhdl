-- 2 input AND gate
library ieee;
use ieee.std_logic_1164.all;
-- https://stackoverflow.com/questions/57202230/how-to-use-std-logic-after-package-package-body-declaration

entity and2 is
  port (a, b : in std_logic;
        c    : out std_logic);
end and2;

architecture Boolean_Eq2 of and2 is
begin
  c <= a and b;
end Boolean_Eq2;


-- 2 input OR gate
library ieee;
use ieee.std_logic_1164.all;

entity or2 is
  port (a, b: in std_logic;
        c   : out std_logic);
end or2;

architecture Boolean_Eq of or2 is
begin
  c <= a or b;
end Boolean_Eq;


-- 2 input XOR gate
library ieee;
use ieee.std_logic_1164.all;

entity xor2 is
  port (a, b: in std_logic;
        c   : out std_logic);
end xor2;

architecture Boolean_Eq of xor2 is
begin
  c <= a xor b;
end Boolean_Eq;


-- half adder
library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
  port (a, b      : in std_logic;
        sum, cout : out std_logic);
end halfadder;

architecture Structure of or2 is
  component and2
    port (a, b: in std_logic;
          c   : out std_logic);
  end component;
  component xor2
    port (a, b: in std_logic;
          c   : out std_logic);
  end component;
begin
  G1: xor2 port map (a, b, sum);
  G2: and2 port map (a, b, cout);
end Structure;
