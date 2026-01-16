`timescale 1ns / 1ps

module doubdab_8bits(
    input [7:0] b_in,
    output [11:0] bcd_out
    );

wire [3:0] partial1;
    assign partial1={1'b0,b_in[7:5]};

    wire [3:0] partial2;
    wire [3:0] partial3;
    wire [3:0] partial4;
    wire [3:0] partial5;
    wire [3:0] partial6;
    wire [3:0] tempsum1;
    wire [3:0] tempsum2;

    dd_add3 u1 (.i(partial1), .o(partial2));

    dd_add3 u2 (.i({partial2[2:0],b_in[4]}), .o(partial3));

    dd_add3 u3 (.i({partial3[2:0],b_in[3]}),.o(partial4));

    dd_add3 u4 (.i({partial4[2:0],b_in[2]}),.o(partial5));

    dd_add3 u5 (.i({partial5[2:0],b_in[1]}),.o(tempsum1));

    dd_add3 u6 (.i({1'b0,partial2[3],partial3[3],partial4[3]}),.o(partial6));

    dd_add3 u7 (.i({partial6[2:0],partial5[3]}),.o(tempsum2));

assign bcd_out[0]= b_in[0];
    assign bcd_out[4:1]=tempsum1[3:0];
    assign bcd_out[8:5]=tempsum2[3:0];
    assign bcd_out[9]=partial6[3];
    assign bcd_out[10]=0;
    assign bcd_out[11]=0;
     
endmodule
