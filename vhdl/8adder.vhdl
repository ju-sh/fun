library ieee;
use ieee.numeric_std.all;

---

entity halfadder is
  port(
    a, b : in bit;
    s, c : out bit;
  );
end halfadder;

architecture halfadder_arch of halfadder is
begin
  s <= a xor b;
  c <= a and b;
end architecture;

---

entity fulladder is
  port(
    a, b, cin : in bit;
    s, cout : out bit;
  );
end fulladder;

architecture fulladder_arch of fulladder is
begin
  s <= a xor b xor cin;
  cout <= (cin and (a xor b)) or (a and b);
end architecture;

---

entity adder8 is
  port(
    a, b : in bit_vector (7 downto 0);
    o : out bit_vector (7 downto 0)
  );
end adder8;

architecture adder8_arch of adder8 is
begin
  o <= a + b;
end architecture;
