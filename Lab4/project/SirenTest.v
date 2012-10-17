`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:40:01 10/16/2012
// Design Name:   SirenGen
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/project/SirenTest.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SirenGen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SirenTest;

	// Inputs
	reg clk;

	// Outputs
	wire speaker;

	// Instantiate the Unit Under Test (UUT)
	SirenGen uut (
		.clk(clk), 
		.speaker(speaker)
	);
	
	always #2 clk= !clk;

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

