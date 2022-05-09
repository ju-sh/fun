library ieee;
use ieee.std_logic_1164.all;

entity counter_tb_ent is
end counter_tb_ent;

architecture counter_tb_arch of counter_tb_ent is
  component count_ent
    port (
      clk : in std_logic;
      load : in std_logic;
      enable : in std_logic;
      d : in std_logic_vector (7 downto 0);
      q : out std_logic_vector (7 downto 0)  -- counter output
    );
  end component;
  for counter_0: counter_ent use work.counter_ent;
  signal 
begin
  -- instantiate component
  counter_0: counter_ent port map(
      clk => clk,
      load => load,
      enable => enable,                                  
      d => d,
      q => q
  );

  -- stimulus process
  begin
    q <= (0 => '1'
          others => '0');  -- 0d1
    load <= '0';
    enable <= '1';
    d <= '0';
    wait for 10 ns;
end counter_tb_arch;
