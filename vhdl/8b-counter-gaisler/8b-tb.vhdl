library ieee;
use ieee.std_logic_1164.all;
-- Don't use this: use ieee.std_logic_arith.all; instead use:
use ieee.numeric_std.all;
use work.counter8_pack.all;

entity counter8_tb is
end counter8_tb;

architecture arch_counter8_tb of counter8_tb is
  component counter8
    port(
      clk : in  std_logic;
      d   : in  counter8_in_type;
      q   : out counter8_out_type
    );
  end component;
    signal t_clk : std_logic;
    signal t_d   : counter8_in_type;
    signal t_q   : counter8_out_type;
begin
    t_counter8: counter8 port map(
        t_clk, t_d, t_q
    );

    process
    begin
        t_d.enable <= '1';  --  start counter
        wait for 20 ns;

        -- reset counter
        t_d.din <= "00000000";
        t_d.load <= '1';
        wait for 20 ns;

        -- set counter free again
        t_d.load <= '0';

        -- test case 1
        wait for 10 ns;
        assert t_q.dout = "0000001"
            report "Test case 1 failed" severity error;
        wait;
    end process;
end arch_counter8_tb;

