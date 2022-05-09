library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent_ctr_tb is
end entity ent_ctr_tb;

architecture arch_ent_ctr_tb of ent_ctr_tb is
  signal t_clk  : std_logic := '0';
  signal t_en   : std_logic := '0';
  signal t_load : std_logic;
  signal t_data : std_logic_vector(1 downto 0);
  signal t_q    : std_logic_vector(1 downto 0);
  -- constant CLOCK : integer := 20;
begin
  t_ctr: entity work.ent_ctr port map(
    t_clk, t_en, t_load, t_data, t_q
  );

  t_clk <= not t_clk after 10 ns;

  process
  begin
    -- Initialize
    t_load <= '1';
    t_data <= "11";
    wait for 20 ns;

    t_load <= '0';
    t_en   <= '1';
    assert t_q = "11"
      report "Test Failed: " & to_string(t_q) & " != 11"
      severity error;
    --report to_string(t_q);
    wait for 20 ns;

    --report to_string(t_q);
    assert t_q = "10"
      report "Test Failed: " & to_string(t_q) & " != 10"
      severity error;
    wait for 20 ns;

    --report to_string(t_q);
    assert t_q = "01"
      report "Test Failed: " & to_string(t_q) & " != 01"
      severity error;
    wait for 20 ns;

    --report to_string(t_q);
    assert t_q = "00"
      report "Test Failed: " & to_string(t_q) & " != 00"
      severity error;
    wait for 20 ns;

    report to_string(t_q);
    wait for 20 ns;

    wait;
  end process;

end arch_ent_ctr_tb;







-- global:
--   zoom: 2
--   date: Thu Mar  3 10:05:58 2022
--   total: 51
--   skip: 0
--   time:
--     scale: 1.00
--     unit:  fs
--     line        : "0                   10
-- channels:
--   ent_ctr_tb:
--     t_clk       : "▁▁╱▔╲▁╱▔╲▁╱▔╲▁╱▔╲▁╱▔╲▁
--     t_en        : "▁▁▁▁╱▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
--     t_load      : "▔▔▔▔╲▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
--     t_data[1:0] : "3 3 3 3 3 3 3 3 3 3 3 
--     t_q[1:0]    : "U 3 3 2 2 1 1 0 0 0 0 
--   t_ctr:
--     clk         : "▁▁╱▔╲▁╱▔╲▁╱▔╲▁╱▔╲▁╱▔╲▁
--     en          : "▁▁▁▁╱▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
--     load        : "▔▔▔▔╲▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
--     data[1:0]   : "3 3 3 3 3 3 3 3 3 3 3 
--     q[1:0]      : "U 3 3 2 2 1 1 0 0 0 0 
--     nextq[1:0]  : "U 3 3 2 2 1 1 0 0 0 0 
