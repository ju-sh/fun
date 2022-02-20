/*
    As described in https://nptel.ac.in/courses/106/105/106105165/
 */

// A structural netlist
module example (A, B, C, D, E, F, Y);
    input A, B, C, D, E, F;
    output Y;
    wire t1, t2, t3, Y;  // Y here is not mandatory

    // # denotes delay in seconds
    nand    #1 G1 (t1, A, B);
    and     #2 G2 (t2, C, ~B, D);  // ~ means NOT
    nor     #1 G3 (t3, E, F);
    nand    #1 G4 (Y, t1, t2, t3);

    // We used two NAND gates above. We could merge the two statements like:
    // nand #1 G1 (t1, A, B),   // comma here
    //         G4 (Y, t1, t2, t3);

endmodule
