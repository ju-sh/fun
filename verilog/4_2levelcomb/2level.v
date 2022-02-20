module testbench;
    reg a, b, c, d, e, f;
endmodule

module two_level(a, b, c, d, e, f);
    input a, b, c, d, e;
    output f;
    wire t1, t2;  // nets

    assign t1 = a & b;
    assign t2 = ~(c | d);
    assign f = ~(t1 & t2);
endmodule
/* Two level design

     |----\
a ---|     |
     | AND |--- t1 ---|----\
b ---|     |          |     |
     |----/           |     |     
                      |NAND |--- f
     |----\           |     |     
c ---|     |          |     |
     | NOR |--- t2 ---|     |
     |     |          |----/
d ---|----/

*/

/*
                    |----\
a ------------------|    |
                    |  & |--- t1 ---|----\
b ------------------|    |          |     |
                    |----/          |     |                 |---|   
                                    |  &  |--- (t1 & t2) ---| ~ |--- ~(t1 & t2)
     |---|          |----\          |     |                 |---|   
c ---| ~ |--- ~c ---|    |          |     |
     |---|          |  | |--- t2 ---|     |
                    |    |          |----/
d ------------------|----/
*/                   
