`timescale 1ns / 1ps

module led_color(
		 input clk,
		 input [1:0] color,
		 output reg led_r,
		 output reg led_g,
		 output reg led_b
		 );
   
   localparam RED = 0;
   localparam YELLOW = 1;
   localparam GREEN = 2;
   localparam OFF = 3;
   
   wire [11:0] pwm_cnt;
   wire	     pwm_12p5;
   wire	     pwm_25;

   pwm_counter u1 (.clk(clk), .pwm_cnt(pwm_cnt));

   pwm_gen #( .PWM_PERCENT(12)) u2_12p5 (.pwm_cnt(pwm_cnt), .pwm_out(pwm_12p5));

   pwm_gen #( .PWM_PERCENT(25)) u3_25 (.pwm_cnt(pwm_cnt), .pwm_out(pwm_25));
   					  
// 
// add the verilog code here to provide the correct pwm signals to the
//  red, green and blue led lights to create the desired color.
//
//  RED = red on at 25% duty cycle pwm  
//  YELLOW = red & green on at 12% duty cycle pwm
//  GREEN = green on at 25% duty cycle pwm
//  OFF = all led outputs set to 0   

endmodule   

