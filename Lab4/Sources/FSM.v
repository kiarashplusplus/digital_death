module FSM (input clk, input reset, input ignit, input driver, input passenger, 
            input reprogram, input expired, output reg [1:0] interval, 
            output reg start_timer, output siren, output status, output [3:0] current_state);
    reg [3:0] state, next_state;
	        
/*
Anti-theft FSM
This finite state machine controls the sequencing for the system. The system has four major modes of operation:

Armed. The status indicator should be blinking with a two-second period; the siren is off. If the ingition switch is turned on go to Disarmed mode, 
    otherwise when a door opens start the appropriate countdown and go to Triggered mode. This is the state the FSM should have when the system is powered on.
Triggered. The status indicator light should be constantly on; the siren is off. If the ignition switch is turned on, go to Disarmed mode. If the 
    countdown expires before the ignition is turned on, go to Sound Alarm Mode.
Sound Alarm. The status indicator light and siren should be constantly on. The alarm should continue to sound until either T_ALARM_ON seconds after 
    all the doors have closed (at which point go to Armed mode) or the ignition switch is turned on (at which point go to Disarmed mode).
Disarmed. The status indicator light and siren should be off. Wait until the ignition switch is turned off, followed by the driver's door 
    opening and closing, then after T_ARM_DELAY seconds go to Armed mode.

*/	 
    parameter s_armed=0;   
    parameter s_triggered_CD=1;
    parameter s_siren=2;
    parameter s_door_closed_CD=3;
    parameter s_disarmed=4;
    parameter s_tran1=5;    //the transition states are required to move from dis-armed to armed.
    parameter s_tran2=6;
    parameter s_tran3_CD=7;


	assign current_state = state;  //outputs the current state for debugging purposes.
	 
	 
    wire blink;   //a square wave is used to produce blinking feature
    squareWave blink_wave (.clk(clk), .square(blink));
    
    
    always @(*) begin
 
        if (reset) begin 
            next_state=s_armed;
            start_timer=0;
            interval=0;            
        end else case (state)

        
            s_armed: begin
                next_state=state;
                if (ignit) next_state=s_disarmed;
                else if (passenger) begin 
                    interval=2'b10;
						  start_timer=1;
						  next_state=s_triggered_CD;
                end else if (driver) begin
                    interval=2'b01;
						  start_timer=1;					 
						  next_state=s_triggered_CD;
                end 
                
            end

            s_triggered_CD: begin 
				        next_state = s_triggered_CD;
						  start_timer=0;
                    if (ignit) begin
                        next_state=s_disarmed;
                     end else if (expired) next_state=s_siren;

				end
            
            s_siren: begin
					 next_state=state;
                if (ignit) next_state=s_disarmed;
					 else if (~passenger && ~driver) begin
                    interval=2'b11;
						  start_timer=1;	
						  next_state=s_door_closed_CD;
					 end else if (passenger || driver) begin
						  interval=2'b11;
						  start_timer=1;
					 end
				end
				            
            s_door_closed_CD: begin 
					 next_state=state;
					 start_timer=0;
                if (ignit) begin
                        next_state=s_disarmed;
					 end else if (driver || passenger) next_state=s_siren;
					 else if (expired) next_state=s_armed;

            end
            
            s_disarmed: begin
					next_state=s_disarmed;
					if(~ignit) next_state=s_tran1;
				end
            s_tran1: begin
					next_state=s_tran1;
					if(driver) next_state=s_tran2;
				end
					
            s_tran2: begin 
					next_state=state;
					if (~driver) begin
					   interval=2'b00;
					   start_timer=1;							
						next_state=s_tran3_CD;
					end
				end
            
            s_tran3_CD:begin
					next_state=state;
					start_timer=0;
				  if(expired)next_state=s_armed;
				  else if (driver) begin
						next_state=s_tran2;
						start_timer=1;
				  end
				end
				
				default: next_state=s_armed;
				
				
        endcase 
    end
    always @(posedge clk) state<=next_state;

    //assing siren and status the values corresponding to the state
    assign siren= ( (state==s_siren) || (state==s_door_closed_CD)); 
    assign status = (state==s_armed) ?  blink: 
	 (state==s_triggered_CD || state==s_siren || state==s_door_closed_CD);
             
             
endmodule
