// A partial version of the physical description of a 4 bit adder
// polysilicon: a high-purity form of silicon. Used in solar cells as well.

// Basically the components are some polygons (mostly rectangles??)

module add4;
    input x[3:0], y[3:0], cy_in;
    output s[3:0], cy4;
    boundary [0, 0, 130, 500];  // coordinates

    port x[0] aluminium width=1 origin=[0, 35];
    port y[0] aluminium width=1 origin=[0, 85];
    port cy_in polysilicon width=2 origin=[70, 0];
    port s[0] aluminium width=1 origin=[120, 65];

    add a0 origin = [0, 0];
    add a1 origin = [0, 120];
endmodule
