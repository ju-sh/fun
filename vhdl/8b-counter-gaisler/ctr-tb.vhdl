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
    signal t_clk : std_logic := '0';
    signal t_d   : counter8_in_type;
    signal t_q   : counter8_out_type;

 --     function to_stringer(n : unsigned) return string is
 --         variable temp : string(1 to (n'length + 3)/4) := (others => 'x');
 --     begin
 --        -- not finished!
 --        return temp;
 --     end to_stringer;
    function to_stringer ( a: std_logic_vector) return string is
    -- https://stackoverflow.com/a/38850022
    variable b : string (1 to a'length) := (others => NUL);
    variable stri : integer := 1; 
    begin
        for i in a'range loop
            b(stri) := std_logic'image(a((i)))(2);
            stri := stri+1;
        end loop;
    return b;
    end function;
begin
    -- unit under test
    uut: counter8 port map(
        clk => t_clk,
        d   => t_d,
        q   => t_q
    );

    process -- stimulus
    begin
        report "Starting simulation...."
            severity note;
        t_clk <= '1';
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
        report "Val: " & to_stringer(t_q.dout) severity note;
        wait until rising_edge(t_clk);

        -- test case 1
        assert t_q.dout = "0000001"
            --report "Test case 1 failed" & to_stringer(t_d.din)
            report "Test case 1 failed" & to_stringer(t_q.dout)
                severity error;
        report "Val: " & to_stringer(t_q.dout) severity note;
        wait until rising_edge(t_clk);

        -- test case 2
        assert t_q.dout = "0000011"
            report "Test case 2 failed" & to_stringer(t_q.dout)
                severity error;
        report "Val: " & to_stringer(t_q.dout) severity note;

            -- to_hex_string() 
        wait until rising_edge(t_clk);

        wait;
    end process;
end arch_counter8_tb;
