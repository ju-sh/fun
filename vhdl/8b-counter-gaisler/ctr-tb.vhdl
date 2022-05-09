library ieee;
use ieee.std_logic_1164.all;
-- Don't use `use ieee.std_logic_arith.all;` Instead use:
use ieee.numeric_std.all;
use work.ctr_pack.all;

entity ent_ctr_tb is
end ent_ctr_tb;

architecture arch_ctr_tb of ent_ctr_tb is
  signal t_clk : std_logic := '0';
  signal t_d   : ctr_in_type;
  signal t_q   : ctr_out_type;
begin
  -- unit under test
  t_ctr: entity work.ent_ctr port map(
    clk => t_clk,
    d   => t_d,
    q   => t_q
  );

  -- Clock period: 20 ns
  t_clk <= not t_clk after 10 ns;

  process
  begin
    wait until rising_edge(t_clk);

    t_d.enable <= '0';      --  disable counter
    t_d.din <= "00000001";  --  start counter
    --wait until rising_edge(t_clk);
    report "Here!!";

    -- reset counter
    t_d.din <= "00000000";
    t_d.load <= '1';
    wait until rising_edge(t_clk);

    -- set counter free again
    t_d.enable <= '1';      --  enable counter
    t_d.load <= '0';
    report "Val: " & to_string(t_q.dout) severity note;
    wait until rising_edge(t_clk);

    -- test case 1
    assert t_q.dout = "0000001"
        --report "Test case 1 failed" & to_string(t_d.din)
        report "Test case 1 failed" & to_string(t_q.dout)
            severity error;
    report "Val: " & to_string(t_q.dout) severity note;
    wait until rising_edge(t_clk);

    -- test case 2
    assert t_q.dout = "0000011"
        report "Test case 2 failed" & to_string(t_q.dout)
            severity error;
    report "Val: " & to_string(t_q.dout) severity note;

        -- to_hex_string() 
    wait until rising_edge(t_clk);

    wait;
  end process;
end arch_ctr_tb;
