
module addsub4 (
           input [3:0] A, B,
           input subsel,
           output [3:0] X,
           output cout, ovf
           );
wire [3:0] C;

assign C[0] = B[0]^subsel;
assign C[1] = B[1]^subsel;
assign C[2] = B[2]^subsel;
assign C[3] = B[3]^subsel;
add4 addsubstage1(.carryin(subsel), .X(A), .Y(C), .S(X), .carryout(cout), .ovf(ovf));


   
endmodule
