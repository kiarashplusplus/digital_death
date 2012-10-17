`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:23:36 10/17/2012
// Design Name:   full_debounce
// Module Name:   /afs/athena.mit.edu/user/k/i/kiarash/Documents/6.111/Lab4/PP/debounceTester.v
// Project Name:  PP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_debounce
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debounceTester;

	// Inputs
	reg reset;
	reg clk;
	reg brake;
	reg hidden;
	reg ignit;
	reg driver;
	reg passenger;
	reg reprogram;

	// Outputs
	wire clean_break;
	wire clean_hidden;
	wire clean_ignit;
	wire clean_driver;
	wire clean_passenger;
	wire clean_reprogram;

	// Instantiate the Unit Under Test (UUT)
	full_debounce uut (
		.reset(reset), 
		.clk(clk), 
		.brake(brake), 
		.clean_break(clean_break), 
		.hidden(hidden), 
		.clean_hidden(clean_hidden), 
		.ignit(ignit), 
		.clean_ignit(clean_ignit), 
		.driver(driver), 
		.clean_driver(clean_driver), 
		.passenger(passenger), 
		.clean_passenger(clean_passenger), 
		.reprogram(reprogram), 
		.clean_reprogram(clean_reprogram)
	);
	
	always #10 clk= !clk;

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		brake = 0;
		hidden = 0;
		ignit = 0;
		driver = 0;
		passenger = 0;
		reprogram = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

