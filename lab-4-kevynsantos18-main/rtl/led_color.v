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


always @(posedge clk)
begin
    case(color)
        RED: begin
            led_r <= pwm_25;
            led_g <= 0;
            led_b <=0;
            end
        YELLOW: begin
            led_r <= pwm_12p5;
            led_g <= pwm_12p5;
            led_b <=0;
            end
        GREEN: begin
            led_r <= 0;
            led_g <= pwm_25;
            led_b <=0;
            end
        OFF: begin
            led_r <= 0;
            led_g <= 0;
            led_b <=0;
            end
        default: begin
            led_r <= 0;
            led_g <= 0;
            led_b <=0;
            end
    endcase
end
   					  
endmodule   

