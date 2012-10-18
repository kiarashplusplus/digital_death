`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:16 10/16/2012 
// Design Name: 
// Module Name:    timer 
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

//The timer counts down the number of seconds specified by the Time Parameter 
//module. It initializes its internal counter to the specified Value when 
//Start_Timer is asserted and decrements the counter when one_hz_enable is 
//asserted. When the internal counter reaches zero, the Expired signal is 
//asserted and the countdown halts until Start_Timer is once again asserted. 

module timer #(parameter mgh=25'd26999999)( 
	 input clk,
    input start_timer,
    input [3:0] value,
	 input reset,
    output expired,
	 output reg [3:0] counter
    );
	 
	 initial begin
        counter=0;
	 end
     
	 reg pause=1'b0;
	 wire pulse;
     
	 Divider #(.clock_27mhz(mgh)) timerD (.clk(clk),.Start_Timer(pause), .one_hz_enable(pulse));
	
	always @(posedge clk) begin
	    if (reset) begin
			pause<=1;
			counter<=0;
			
		end else if (start_timer) begin
			counter<=value;
			pause<=1;
			
		end else
			pause <= 0;
			
			if (pulse) begin					
				if (~(counter==0)) 
					counter<=counter-1;
			end
			
	 end

	assign expired = (counter == 0);

endmodule
