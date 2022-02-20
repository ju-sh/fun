-- http://esd.cs.ucr.edu/labs/tutorial/tb_counter.vhd
library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity counter8_tb is
end counter8_tb;

architecture arch_counter8_tb of counter8_tb is
    component counter
        port (
            clk: in std_logic;
            reset: in std_logic;
            enable: in std_logic;
            q: out std_logic_vector(1 downto 0)
        );
    end component;
    signal t_clk: std_logic;
    signal t_reset: std_logic;
    signal t_enable: std_logic;
    signal t_q: std_logic_vector(1 downto 0);
begin
    t_counter: counter port map(
        t_clk, t_reset, t_enable, t_q
    );
    process
    begin
        t_clk <= '0';
        wait for 5 ns;
        t_clk <= '1';
        wait for 5 ns;
    end process;

    process
    begin
        t_enable <= '1';  --  start counter
        wait for 20 ns;
        t_reset <= '0';   -- reset counter

        -- test case 1
        wait for 10 ns;
        assert t_q = "11"
            report "Test case 1 failed" severity error;
        wait for 10 ns;
        assert t_q = "00"
            report "Test case 2 failed" severity error;
        wait for 10 ns;
        assert t_q = "01"
            report "Test case 3 failed" severity error;
        wait for 10 ns;
        assert t_q = "10"
            report "Test case 4 failed" severity error;
        wait for 10 ns;
        assert t_q = "11"
            report "Test case 5 failed" severity error;
        wait;
    end process;
end arch_counter8_tb;

