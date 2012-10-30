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
    output reg expired,
	 output reg [3:0] counter
    );
	 
	 initial begin
        counter=0;
	 end
     
	 reg pause=1'b0;
	 wire pulse;

	 Divider #(.clock_27mhz(mgh)) timerD (.clk(clk),.Start_Timer(pause), .one_hz_enable(pulse));
	
	always @(posedge clk) begin
	    if (reset) begin   //reseting the values to the initial value
			pause<=1;
			counter<=0;
			expired<=1;
			
		end else if (start_timer) begin  //pausing the timer and  set the timer to count down from "value" 
			counter<=value;
			pause<=1;
			expired<=0;
			
		end else //starting to count down and "expired will be 1 when counting is done. 
			pause <= 0;
			
			if (pulse) begin					
				if (~(counter==0)) 
					counter<=counter-1;
				else expired<=1;
				
			end
			
	 end

endmodule
