`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:49 10/17/2012
// Design Name:   FSM
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/PP/FSMtester.v
// Project Name:  PP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSMtester;

	// Inputs
	reg clk;
	reg ignit;
	reg driver;
	reg passenger;
	reg reprogram;
	reg expired;

	// Outputs
	wire [1:0] interval;
	wire start_timer;
	wire siren;
	wire status;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.ignit(ignit), 
		.driver(driver), 
		.passenger(passenger), 
		.reprogram(reprogram), 
		.expired(expired), 
		.interval(interval), 
		.start_timer(start_timer), 
		.siren(siren), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ignit = 0;
		driver = 0;
		passenger = 0;
		reprogram = 0;
		expired = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

