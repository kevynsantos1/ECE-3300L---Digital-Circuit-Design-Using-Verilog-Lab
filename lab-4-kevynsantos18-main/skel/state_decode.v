`timescale 1ns / 1ps

module state_decode (
		 input [6:0] countdown,
		 output reg [1:0] color_light_1,
		 output reg [1:0] color_light_2,
		 output reg [7:0] display_time
		 );
		 
   localparam RED = 0;
   localparam YELLOW = 1;
   localparam GREEN = 2;
   localparam OFF = 3;

//
// Fill in the Verilog code required to
//   generate the correct LED colors and
//   the number to display on the 7-segment
//   display.
//
   
endmodule
   
