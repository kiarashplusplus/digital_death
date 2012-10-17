`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:11 10/16/2012 
// Design Name: 
// Module Name:    FuelLogic 
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
module FuelLogic(
    input brake,
    input hidden,
    input ignit,
    output reg power
    );

	always @(*) begin
		
		if (brake && hidden && ignit)
			power<=1;
		else
			power<=0;		
		
	/*	if (~ignit) 
			power<=0;
		else if (brake && hidden)
			power<=1;
		else
			power<=0;
*/
	end

endmodule
