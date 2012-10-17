`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:16 10/16/2012 
// Design Name: 
// Module Name:    timer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module timer(
	 input clk,
    input start_timer,
    input [3:0] value,
	 input reset,
    output expired
    );
	 
	 
	 reg pause=1'b0;
	 reg [3:0] counter=0;
	 wire pulse;
	 Divider #(.clock_27mhz25'd27000000)) timerD (.clk(clk),.Start_Timer(pause), .one_hz_enable(pulse));
	
	always @(posedge clk) begin

	   if (reset) begin
			pause<=1;
			counter<=start_timer;
			
		end else if (start_timer) begin
			counter<=start_timer;
			pause<=1;
		end else
			pause <= 0;
			
			if (pulse) begin					
				if (~(counter==0)) 
					counter<=counter-1;
			end
			
	 end

	assign expired = (counter == 0);

endmodule
