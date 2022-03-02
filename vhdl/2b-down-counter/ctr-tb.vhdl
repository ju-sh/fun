library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent_ctr_tb is
end entity ent_ctr_tb;

architecture arch_ent_ctr_tb of ent_ctr_tb is
  component comp_ctr
    port (
      clk  : in  std_logic;
      en   : in  std_logic;
      load : in  std_logic;
      data : in  std_logic_vector(1 downto 0);
      q    : out std_logic_vector(1 downto 0)
    );
  end component;
  signal t_clk  : std_logic := '0';
  signal t_en   : std_logic := '0';
  signal t_load : std_logic;
  signal t_data : std_logic_vector(1 downto 0);
  signal t_q    : std_logic_vector(1 downto 0);
begin
  t_clk <= not t_clk after 10 ns;
  t_ctr: comp_ctr use entity work.ent_ctr port map(
    t_clk, t_en, t_load, t_data, t_q
  );

  process(t_clk)
  begin
    if rising_edge(t_clk) then
      assert t_q = "00"
        report "Test Failed" severity error;
    end if;
  end process;

end arch_ent_ctr_tb;
