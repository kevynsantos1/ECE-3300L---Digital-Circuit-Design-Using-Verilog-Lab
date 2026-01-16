
module mult4 (
         input [3:0] A, B,
         output [7:0] X
         );

wire [3:0] partial;
wire [3:0] partial1;
wire [3:0] partial2;
wire [3:0] partial3;

wire [3:0] ppartial;

wire [3:0] adderprod;
wire [3:0] adderprod1;
wire [0:1] carrynover;
wire [0:1] carrynover1;
wire [0:1] carrynover2;

assign partial = A & {4{B[0]}};
assign X[0] = partial[0];

assign ppartial[2:0]= partial[3:1];
assign ppartial[3]=0;
assign partial1= A& {4{B[1]}};
assign partial2= A & {4{B[2]}};
assign partial3= A& {4{B[3]}};


add4 stage1(.carryin(0),.X(partial1),.Y({1'b0,partial[3:1]}),.S(adderprod),.carryout(carrynover[0]),.ovf(carrynover[1]));
assign X[1]= adderprod[0];

add4 stage2(.carryin(0), .X(partial2), .Y({carrynover[0],adderprod[3:1]}), .S(adderprod1), .carryout(carrynover1[0]) , .ovf(carrynover1[1]));

assign X[2]=adderprod1[0];

wire [0:3] tempprod;
add4 stage3(.carryin(0), .X (partial3),.Y ({carrynover1[0],adderprod1[3:1]}),.S (tempprod),.carryout( carrynover2[0]) ,.ovf (carrynover2[1]));
assign X[7]=carrynover2[0];
assign X[6:3]= tempprod;


   
endmodule 


