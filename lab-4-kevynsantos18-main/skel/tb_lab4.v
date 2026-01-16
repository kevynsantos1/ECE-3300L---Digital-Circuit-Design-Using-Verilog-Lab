`timescale 1ns / 1ps

module tb_lab4();

   reg clk;

   wire [6:0] inv_leds;
   wire [7:0] enb_leds;

   wire	      led1_r, led1_g, led1_b;
   wire	      led2_r, led2_g, led2_b;
   

   traffic_lights dut0 (
			// Outputs
			.led1_r		(led1_r),
			.led1_g		(led1_g),
			.led1_b		(led1_b),
			.led2_r		(led2_r),
			.led2_g		(led2_g),
			.led2_b		(led2_b),
			.inv_leds	(inv_leds[6:0]),
			.enb_leds	(enb_leds[7:0]),
			// Inputs
			.clk		(clk));
   
   sim_8x7seg tb_u1(.clk (clk), .inv_leds(inv_leds), .enb_leds(enb_leds));

   sim_ledcolor tb_u2(
		      .clk		(clk),
		      .led_r		(led1_r),
		      .led_g		(led1_g),
		      .led_b		(led1_b),
		      .lednum		(1));

   sim_ledcolor tb_u3(
		      .clk		(clk),
		      .led_r		(led2_r),
		      .led_g		(led2_g),
		      .led_b		(led2_b),
		      .lednum		(2));
   
   always #(5) clk = ~clk;
   
   initial
     begin
        clk = 1'b0;
        #36_000_000_000;
        $finish;
     end

endmodule
