module testbench;
    reg f, x, y;
    simpleand DUT(f, x, y);

    initial
    begin
        $dumpfile ("simpleand.vcd");
        $dumpvars (0, testbench);
        $monitor ($time, "f=%b, x=%b, y=%b", f, x, y);
        #1 x=0; y=0; 
        #3 x=0; y=1; 
        #3 x=1; y=0; 
        #3 x=1; y=1; 
        #3 $finish;
    end
endmodule
/*
      -------\
x -->-|      |
      |      |-----> f
y -->-|      |
      -------/
*/
