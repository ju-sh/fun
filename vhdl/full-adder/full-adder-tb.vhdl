-- test bench has no ports
--
-- ghdl -a %
-- ghdl -e fadder_tb
-- ghdl -r fadder_tb
entity fadder_tb is
end fadder_tb;

architecture fadder_tb_arch of fadder_tb is
  component fadder
    port(
      a, b, cin : in bit;
      s, cout : out bit
    );
  end component;

  -- specify which entity is bound with the component
  for fadder_0: fadder use entity work.fadder;
  signal a, b, cin, s, cout : bit;
begin
  -- instantiate component
  fadder_0: fadder port map(a => a, b => b, cin => cin,
                            s => s, cout => cout);

  process
    type pattern_type is record
      -- full adder inputs
      a, b, cin : bit;

      -- expected output
      s, cout : bit;
    end record;

    -- patterns to be applied
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array := (
    --  a    b   cin   s   cout
      ('0', '0', '0', '0', '0'),
      ('0', '0', '1', '1', '0'),
      ('0', '1', '0', '1', '0'),
      ('0', '1', '1', '0', '1'),
      ('1', '0', '0', '1', '0'),
      ('1', '0', '1', '0', '1'),
      ('1', '1', '0', '0', '1'),
      ('1', '1', '1', '1', '1')
    );
  begin  -- start of the process
    for i in patterns'range loop
      -- set inputs
      a <= patterns(i).a;
      b <= patterns(i).b;
      cin <= patterns(i).cin;

      -- wait for output
      wait for 1 ns;

      -- check output
      assert s = patterns(i).s
        report "bad sum value" severity error;
      assert cout = patterns(i).cout
        report "bad carry out value" severity error;
    end loop;
    assert false report "end of tests" severity note;

    -- wait forever (this will finish the simulation
    wait;
  end process;
end architecture;
