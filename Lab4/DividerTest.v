`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:06:56 10/16/2012
// Design Name:   Divider
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/project/DividerTest.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DividerTest;

	// Inputs
	reg clk;
	reg Start_Timer;

	// Outputs
	wire one_hz_enable;
	
	// Instantiate the Unit Under Test (UUT)
	Divider #(.clock_27mhz(20)) uut (
		.clk(clk), 
		.Start_Timer(Start_Timer), 
		.one_hz_enable(one_hz_enable)
		);

	always #2 clk= !clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		Start_Timer = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#30;
		Start_Timer=1;
		#30;
		Start_Timer=0;

	end      
endmodule

