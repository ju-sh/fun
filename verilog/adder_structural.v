// Structural definition.
// netlist.
// Can be specified at different levels
// Each successive level reveals more details

// A 4-bit ripple carry adder
// Consists of 4 full adders
// Each full adder has circuits for sum and carry.

module sum (sum, a, b, cy_in);
    input a, b, cy_in;
    output sum;
    wire t;

    xor x1 (t, a, b)
    xor x2 (sum, cy_in, t)
endmodule

module carry (cy_out, a, b, cy_in);
    input a, b, cy_in;
    output cy_out;
    wire t1, t2, t3;

    and g1 (t1, a, b) ;
    and g2 (t2, b, c) ;
    and g3 (t3, a, c) ;
    or g4 (cy_out, t1, t2, t3);
endmodule


module add (cy_out, sum, a, b, cy_in);
    input a, b, cy_in;
    output sum, cy_out;
    
    sum s1 (sum, a, b, cy_in);
    carry c1 (cy_out, a, b, cy_in);
endmodule

primitive add4 (s, cy4, cy_in, x, y);
    input [3:0] x, y; // a vector. A 4-bit number here.
    input cy_in;
    output s, cy4;

    // Instantiating the constituent full adders
    add 
