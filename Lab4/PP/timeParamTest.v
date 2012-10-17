`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:49:25 10/16/2012
// Design Name:   timeParam
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/PP/timeParamTest.v
// Project Name:  PP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timeParam
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module timeParamTest;

	// Inputs
	reg clk;
	reg [1:0] Time_Parameter_Selector;
	reg [3:0] Time_Value;
	reg Reprogram;
	reg reset;
	reg [1:0] interval;

	// Outputs
	wire [3:0] value;
	wire [15:0] data;

	// Instantiate the Unit Under Test (UUT)
	timeParam uut (
		.clk(clk), 
		.Time_Parameter_Selector(Time_Parameter_Selector), 
		.Time_Value(Time_Value), 
		.Reprogram(Reprogram), 
		.reset(reset), 
		.interval(interval), 
		.value(value),
		.data(data)
	);
	
	always #10 clk= !clk;

	wire [3:0] ARM_DELAY;
	wire [3:0] DRIVER_DELAY;
	wire [3:0] PASSENGER_DELAY;
	wire [3:0] ALARM_ON;

	assign ARM_DELAY = data[15:12];
	assign DRIVER_DELAY = data[11:8];
	assign PASSENGER_DELAY = data[7:4];
	assign ALARM_ON = data[3:0];

	initial begin
		// Initialize Inputs
		clk = 0;
		Time_Parameter_Selector = 0;
		Time_Value = 0;
		Reprogram = 0;
		reset = 0;
		interval = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Time_Parameter_Selector=2'b11;
		Reprogram=0;
		Time_Value=4'b1111;	
		#100
		Time_Parameter_Selector=2'b10;
		Reprogram=1;
		Time_Value=4'b0000;
		#100;
		Time_Parameter_Selector=2'b00;
		Reprogram=0;
		Time_Value=4'b0001;	
		#100;
		Time_Parameter_Selector=2'b00;
		Reprogram=1;
		Time_Value=4'b0001;	
		#100;
		reset=1;
		

	end
      
endmodule

