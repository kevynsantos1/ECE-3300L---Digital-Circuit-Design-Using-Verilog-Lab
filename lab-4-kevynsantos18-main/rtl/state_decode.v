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
 
 


always @(countdown)
begin
    if (countdown <=120 && countdown > 80) begin
                color_light_1 = GREEN;
                color_light_2 = RED;
                end
    else if (countdown <= 80 && countdown > 70) begin
                color_light_1 = YELLOW;
                color_light_2 = RED;
                end
    else if (countdown <= 70 && countdown > 60) begin
                color_light_1 = RED;
                color_light_2 = RED;
                end
    else if (countdown <= 60 && countdown > 20) begin 
                color_light_1 = RED;
                color_light_2 = GREEN;
                end
    else if (countdown <= 20 && countdown > 10) begin
                color_light_1 = RED;
                color_light_2 = YELLOW;
                end
    else if (countdown <= 10) begin
                color_light_1 = RED;
                color_light_2 = RED;
                end
    else begin
                color_light_1 = OFF;
                color_light_2 = OFF;
                end
    end
    
    always @(countdown) begin
    
    if (countdown>60)begin
        display_time = countdown-60;
        end
       
    else if (countdown <= 60) begin
        display_time = countdown;
        end
        
    end
    
endmodule
   
