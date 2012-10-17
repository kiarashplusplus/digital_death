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
    output power
    );
	
	assign power=(brake && hidden && ignit)? 1:0;


endmodule
