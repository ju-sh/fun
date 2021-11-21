-- https://ghdl.github.io/ghdl/quick_start/simulation/adder/index.html

entity fadder is
  port(
    a, b, cin : in bit;
    s, cout : out bit
  );
end fadder;

architecture fadder_arch of fadder is
begin
  s <= a xor b xor cin;
  cout <= (a and b) or (a and cin) or (b and cin);
end architecture;
