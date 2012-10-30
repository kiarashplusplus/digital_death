`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:08 10/16/2012 
// Design Name: 
// Module Name:    SirenGen 
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
module #(parameter f1, parameter f2) SirenGen(
    input clk,
	 input on,
    output reg speaker
    );
	 
	wire sp1;
	wire sp2;
	wire toggle;
	squareWave #(.mhz(f1)) freq1 (.clk(clk), .square(sp1));
	squareWave #(.mhz(f2)) freq2 (.clk(clk), .square(sp2));
	squareWave #(.mhz(2*(f1+f2))) toggle0 (.clk(clk), .square(toggle));

	always @(posedge clk) begin

		if (on) begin 
			if (toggle)
				speaker <= sp1;
			else 
				speaker <= sp2;
		end else
			speaker <=0;
		
	end

endmodule

module #(parameter mhz=25'd27000000) squareWave(input clk, output reg square);

	initial square = 0;

	wire pulse;
	Divider #(.clock_27mhz(mhz)) d1 (.clk(clk),.Start_Timer(1'd0), .one_hz_enable(pulse));

	always @ (posedge pulse) begin
		square <= ~square;
		
	end
endmodule
