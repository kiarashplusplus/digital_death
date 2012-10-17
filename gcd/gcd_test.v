`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:15:35 10/02/2012
// Design Name:   gcd
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab3/project/gcd/gcd_test.v
// Project Name:  gcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gcd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gcd_test;

	// Inputs
	reg clk;
	reg start;
	reg [15:0] Ain;
	reg [15:0] Bin;

	// Outputs
	wire [15:0] answer;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	gcd uut (
		.clk(clk), 
		.start(start), 
		.Ain(Ain), 
		.Bin(Bin), 
		.answer(answer), 
		.done(done)
	);
	
	always #5 clk = !clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		Ain = 0;
		Bin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Ain = 21;
		Bin = 15;		
		start=1;
		
		#10
		start=0;
		
	end
      
endmodule

