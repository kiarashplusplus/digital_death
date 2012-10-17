`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:49:57 10/16/2012
// Design Name:   Divider
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/project/dividerTest.v
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

module dividerTest;

	// Inputs
	reg clk;
	reg Start_Timer;

	// Outputs
	reg one_hz_enable;

	// Instantiate the Unit Under Test (UUT)
	Divider uut (
		.clk(clk), 
		.Start_Timer(Start_Timer), 
		.one_hz_enable(one_hz_enable)
	);
	
	always #20 clk= !clk

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

