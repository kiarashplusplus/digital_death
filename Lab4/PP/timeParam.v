`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:56 10/16/2012 
// Design Name: 
// Module Name:    timeParam 
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
module timeParam(
    input clk,
    input [1:0] Time_Parameter_Selector,
    input [3:0] Time_Value,
    input Reprogram,
	 input reset,
    input [1:0] interval,
    output reg [3:0] value,
	 output reg [3:0] ARM_DELAY,
	 output reg [3:0] DRIVER_DELAY,
	 output reg [3:0] PASSENGER_DELAY,
	 output reg [3:0] ALARM_ON	 
    );
	 
	parameter T_ARM_DELAY=4'b0110;
	parameter T_DRIVER_DELAY=4'b1000;
	parameter T_PASSENGER_DELAY=4'b1111;
	parameter T_ALARM_ON=4'b1010;
	
	initial begin
		ARM_DELAY=T_ARM_DELAY;
		DRIVER_DELAY=T_DRIVER_DELAY;
		PASSENGER_DELAY=T_PASSENGER_DELAY;
		ALARM_ON=T_ALARM_ON;
	end
	
	always @(posedge clk) begin
	
		if (reset) begin 
		{ARM_DELAY, DRIVER_DELAY, PASSENGER_DELAY,ALARM_ON}<=
		{T_ARM_DELAY, T_DRIVER_DELAY, T_PASSENGER_DELAY,T_ALARM_ON};
		
		end else if (Reprogram) begin		
			case(Time_Parameter_Selector)
				2'b00: ARM_DELAY<=Time_Value;
				2'b01: DRIVER_DELAY<=Time_Value;
				2'b10: PASSENGER_DELAY<=Time_Value;
				2'b11: ALARM_ON<=Time_Value;		
			endcase
		end else begin

			case (interval)
				2'b00: value<=ARM_DELAY;
				2'b01: value<=DRIVER_DELAY;
				2'b10: value<=PASSENGER_DELAY;
				2'b11: value<=ALARM_ON;
			endcase
		end
		
	end
	
	
endmodule
