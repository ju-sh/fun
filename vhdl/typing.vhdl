-- Trying out defining a custom type

entity fadder is
  port(
    a, b, cin : in bit;
    s, cout : out bit
  );
end fadder;

architecture fadder_arch of fadder is
-- type word is array (0 to 15) of bit;
type color is (red,green,blue);
begin
  s <= a xor b xor cin;
  cout <= (a and b) or (a and cin) or (b and cin);
end architecture;
