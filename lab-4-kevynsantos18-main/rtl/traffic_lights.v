`timescale 1ns / 1ps
   
module traffic_lights(
	    input	 clk,
	    output	 led1_r,
	    output	 led1_g,
	    output	 led1_b,
	    output	 led2_r,
	    output	 led2_g,
	    output	 led2_b,
            output [6:0] inv_leds,
            output [7:0] enb_leds
	    );

   wire [1:0]	   color_1, color_2;
   wire [7:0]	   display_time;
   wire [11:0]	   b_bcd;
   wire [2:0]	   sel;
   wire [3:0]	   bcd_digit;
   wire [6:0]	   countdown;
   
   led_color tu1 (.clk(clk), .color(color_1), .led_r(led1_r), .led_g(led1_g), .led_b(led1_b));
   led_color tu2 (.clk(clk), .color(color_2), .led_r(led2_r), .led_g(led2_g), .led_b(led2_b));

   timer_12sec tu3 (.clk(clk), .countdown(countdown));
   
   state_decode tu4 (.countdown(countdown), .color_light_1(color_1), .color_light_2(color_2), .display_time(display_time));

   doubdab_8bits u2 (.b_in (display_time), .bcd_out (b_bcd));

   count_3bit_select u3 (.clk(clk), .sel(sel));

   decode_enb_leds u4 (.sel(sel), .enb_leds(enb_leds));

   mux_4in_8to1 u5 (.in0(b_bcd[3:0]), .in1(b_bcd[7:4]), .in2(b_bcd[11:8]), .in3(4'h0), 
		    .in4(4'h0), .in5(4'h0), .in6(4'h0), .in7(4'h0), .sel(sel), .out(bcd_digit) );

   seven_seg_decoder u6 (.b_in(bcd_digit), .inv_leds(inv_leds));
   
endmodule	

