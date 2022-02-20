module testbench;
    // Instantiating the 'args' of the module being tested
    reg A, B, C, D, E, F;  // LHS vars
    wire  Y;    // RHS vars
    example DUT(A, B, C, D, E, F, Y);

    // initial block will be executed only once
    initial
    begin
        // Following two lines for gtkwave
        $dumpfile ("example.vcd");  // vcd: Value Change Dump
        $dumpvars (0, testbench);  // 0 means all the variables in the
                                   // testbench module

        // Monitor these variables. When any of them changes, 'print'.
        // $time: simulation time
        // %b: bit
        $monitor ($time, "A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, Y=%b",
            A, B, C, D, E, F, Y);
        #5 A=1; B=0; C=0; D=1; E=0; F=0;  // wait time 5 units and apply these
                                          // values
        #5 A=0; B=0; C=1; D=1; E=0; F=0;
        #5 A=1; C=0;
        #5 F=1;
        #5 $finish;
    end
endmodule
