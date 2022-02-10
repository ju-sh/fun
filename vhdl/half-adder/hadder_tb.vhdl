library ieee;
use ieee.std_logic_1164.all;

entity hadder_tb is
end hadder_tb;

architecture arch_hadder_tb of hadder_tb is
    component hadder
        port(
            a, b: in std_logic;
            s, c: out std_logic
        );
    end component;

    -- mention which entity is bound with the component
    --for hadder_0: hadder use entity work.hadder;

    signal tb_a, tb_b, tb_s, tb_c: std_logic;
begin
    hadder_0: hadder port map(
        a => tb_a,
        b => tb_b,
        s => tb_s,
        c => tb_c
    );
    process
        type pattern_type is record
            a, b, s, c: std_logic;
        end record;

        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns: pattern_array := (
    --    a    b    s    c  
        ('0', '0', '0', '0'),
        ('0', '1', '1', '0'),
        ('1', '0', '1', '0'),
        ('1', '1', '0', '1')
        );
    begin
        for i in patterns'range loop
            -- Feed input
            tb_a <= patterns(i).a;
            tb_b <= patterns(i).b;

            -- Wait for output to form
            wait for 1 ns;

            -- Check output
            assert tb_s = patterns(i).s
                report "Bad sum '" & std_logic'image(tb_s)  &
                       "' for a=" & std_logic'image(tb_a) &
                       ", b=" & std_logic'image(tb_b) severity error;
            assert tb_c = patterns(i).c
                report "Bad carry '" & std_logic'image(tb_c)  &
                       "' for a=" & std_logic'image(tb_a) & ", b=" &
                       std_logic'image(tb_b)
                       severity error;
        end loop;
        assert false report "End of tests" severity note;

        -- wait forever
        wait;
    end process;
end arch_hadder_tb;
