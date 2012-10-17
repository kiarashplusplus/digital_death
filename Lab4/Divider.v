`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:56 10/16/2012 
// Design Name: 
// Module Name:    Divider 
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
module Divider #(parameter clock_27mhz=27000000)(input clk,input Start_Timer,
	output reg one_hz_enable);
	
	reg [25:0] counter=0;
	
	always @ (posedge clk) begin	 
		one_hz_enable<=0;		
		if (Start_Timer) begin
			counter<=0;
		end else if (counter==clock_27mhz) begin
			one_hz_enable<=1;
			counter<=0;
		end else begin
			counter<=counter+1;
		end
	end

endmodule