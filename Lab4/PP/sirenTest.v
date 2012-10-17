`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:15:12 10/16/2012
// Design Name:   sirenGen
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/PP/sirenTest.v
// Project Name:  PP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sirenGen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sirenTest;

	// Inputs
	reg clk;
	reg on;

	// Outputs
	wire speaker;

	// Instantiate the Unit Under Test (UUT)
	sirenGen #(.f1(15), .f2(107)) uut (
		.clk(clk), 
		.on(on), 
		.speaker(speaker)
	);
	
	always #1 clk= !clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		on = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		on=1;
		
		
	end
      
endmodule

