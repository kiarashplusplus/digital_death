`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:18:42 10/16/2012
// Design Name:   timer
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/PP/timerTest.v
// Project Name:  PP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module timerTest;

	// Inputs
	reg clk;
	reg start_timer;
	reg [3:0] value;
	reg reset;

	// Outputs
	wire expired;

	// Instantiate the Unit Under Test (UUT)
	timer uut (
		.clk(clk), 
		.start_timer(start_timer), 
		.value(value), 
		.reset(reset), 
		.expired(expired)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start_timer = 0;
		value = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

