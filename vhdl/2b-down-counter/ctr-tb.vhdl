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

    -- wait til t_clk changes and loads "11"
    wait on t_clk;

    -- start counting
    t_load <= '0';
    t_en   <= '1';
  end process;

  postponed process(t_clk)
  begin
    if rising_edge(t_clk) then
      assert t_q = "11"
        report "Test Failed" & to_string(t_q)
        severity error;
    end if;
  end process;

end arch_ent_ctr_tb;
