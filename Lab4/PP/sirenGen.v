`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:36 10/16/2012 
// Design Name: 
// Module Name:    sirenGen 
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
module sirenGen #(parameter f1=67500, parameter f2=38571)(
    input clk,
	 input on,
    output speaker
    );
	 
	wire sp1;
	wire sp2;
	wire toggle;
	squareWave #(.mhz(f1)) freq1 (.clk(clk), .square(sp1));
	squareWave #(.mhz(f2)) freq2 (.clk(clk), .square(sp2));
	squareWave #(.mhz(2*(f1+f2))) toggle0 (.clk(clk), .square(toggle));
	
	assign speaker= on && ((toggle) ? sp1 : sp2);
	

endmodule

module squareWave #(parameter mhz=25'd27000000)(input clk, output reg square);

	initial square = 0;

	wire pulse;
	Divider #(.clock_27mhz(mhz)) d1 (.clk(clk),.Start_Timer(1'd0), .one_hz_enable(pulse));

	always @ (posedge pulse) begin
		square <= ~square;
		
	end
endmodule
