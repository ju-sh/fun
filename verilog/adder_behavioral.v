// Behavioural
module carry(S, Cy, A, B, C);
    input A, B, C;
    output S, Cy;
    assign S = A ^ B ^ C;
    assign Cy = (A & B) | (B & C) | (A & C);
endmodule




/*
primitive sum(S, A, B, C);
    input A, B, C;
    output S;
    table
        0   0   0   :   0;
        0   0   1   :   1;
        0   1   0   :   1;
        0   1   1   :   0;
        1   0   0   :   1;
        1   0   1   :   0;
        1   1   0   :   0;
        1   1   1   :   1;
    endtable
endprimitive

primitive carry(Cy, A, B, C);
    input A, B, C;
    output Cy;
    table
        1   1   ?   :   1;
        1   ?   1   :   1;
        ?   1   1   :   1;
        0   0   ?   :   0;
        ?   0   0   :   0;
        0   ?   0   :   0;
    endtable
endprimitive
*/
