`timescale 1ns / 1ps

module tb_lab3();

   reg clk;

   reg [1:0] op_in;
   reg [3:0] a_in;
   reg [3:0] b_in;

   wire [6:0] inv_leds;
   wire [7:0] enb_leds;
   wire	      cout, ovf;

   calc_7seg dut0 (
		 // Outputs
		 .inv_leds		(inv_leds[6:0]),
		 .enb_leds		(enb_leds[7:0]),
		 .cout			(cout),
		 .ovf			(ovf),
		 // Inputs
		 .clk			(clk),
		 .OP			(op_in[1:0]),
		 .A			(a_in[3:0]),
		 .B			(b_in[3:0]));
   
   sim_8x7seg tb_u1(.clk (clk), .inv_leds(inv_leds), .enb_leds(enb_leds));

   always #(5) clk = ~clk;
   
   initial
     begin
        clk = 1'b0;
	op_in = 2'b00;
	a_in = 4'd3;
        b_in = 4'd2;
        #2000000;
	op_in = 2'b10;
	a_in = 4'd8;
        b_in = 4'd9;
        #2000000;
//
// You must add more tests here
//	
        $finish;
     end

endmodule // tb_lab3                                                                                                                                          
