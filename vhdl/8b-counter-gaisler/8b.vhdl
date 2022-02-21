library ieee;
use ieee.std_logic_1164.all;

package counter8_pack is
  type counter8_in_type is record
    enable : std_logic;
    load   : std_logic;
    din    : std_logic_vector(7 downto 0);
  end record;
  
  type counter8_out_type is record
    zero   : std_logic;
    dout   : std_logic_vector(7 downto 0);
  end record;
  
  component counter8
    port(
      clk : in  std_logic;
      d   : in  counter8_in_type;
      q   : out counter8_out_type
    );
  end component;
end package;





library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.counter8_pack.all;

entity counter8 is
  port(
    clk : in  std_logic;
    d   : in  counter8_in_type;
    q   : out counter8_out_type
  );
end counter8;


architecture counter8_arch of counter8 is
  type reg_type is record
    load: std_logic;
    zero: std_logic;
    enable: std_logic;
    dout: std_logic_vector(7 downto 0);
  end record;

  signal r, rin : reg_type;
begin

  -- Combinatorial process
  combinatorial: process(d, r)
    variable v : reg_type;
  begin
    -- Copy values from r. We'll change only what that we need to change.
    v := r;
  
    -- Changing what we need to change
    v.load := d.load;
    v.enable := d.enable;
    v.zero := '0';
  
    -- Increment counter if enabled
    if r.enable = '1' then
      v.dout := std_logic_vector(unsigned(r.dout) + 1);
    end if;
  
    -- Load and set counter value if load is active
    if r.load = '1' then
      v.dout := r.dout;
    end if;
  
    -- Set 'zero' if counter value is 0
    if r.dout = "00000000" then
      v.zero := '1';
    end if;
  
    rin <= r;
    q.dout <= r.dout;
    q.zero <= r.zero;
  end process;
  
  
  -- Sequential process
  sequential: process(clk)
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process;
end counter8_arch;










-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- --use ieee.std_logic_arith.all;
-- 
-- entity count8 is
--   port(
--     clk   : in std_logic;
-- 
--     -- load new value to set count
--     load  : in std_logic;
-- 
--     -- value used to set counter when load is active
--     count : in std_logic;
-- 
--     -- 
--     d     : in std_logic_vector(7 downto 0);
-- 
--     -- output value
--     q     : out std_logic_vector(7 downto 0)
--   );
-- end count8;
-- 
-- architecture count8_arch of count8 is
--   signal r, rin : std_logic_vector(7 downto 0);
-- begin
--   combinational: process(load, count, d, r)
--     variable tmp : std_logic_vector(7 downto 0);
--   begin
--     if load = '1' then
--       tmp := d;
--     else
--       tmp := r;
--     end if;
--     rin <= tmp;
--     q <= r;
--   end process;
-- 
--   sequential: process(clk)
--   begin
--     if rising_edge(clk) then
--         r <= rin;
--     end if;
--   end process;
-- end count8_arch;
