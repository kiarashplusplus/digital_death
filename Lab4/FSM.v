module FSM (input clk, input reset, input ignit, input driver, input passenger, 
            input reprogram, input expired, output reg [1:0] interval, 
            output reg start_timer, output siren, output status, output [2:0] current_state);
    reg [3:0] state, next_state;
	        
	 
    parameter s_armed=0;   
    parameter s_triggered_CD=1;
    parameter s_siren=2;
    parameter s_door_closed_CD=3;
    parameter s_disarmed=4;
    parameter s_tran1=5;    
    parameter s_tran2=6;
    parameter s_tran3_CD=7;

	 assign current_state = state;
	 
    initial begin
		interval=0;
		start_timer=0;
		state=s_armed;
		next_state=s_armed;
	 end
	 
    wire blink;
    squareWave blink_wave (.clk(clk), .square(blink));
    
    
    always @(*) begin
 
        if (reset) begin 
            next_state=s_armed;
            start_timer=0;
            interval=0;            
        end else case (state)
        
            s_armed: begin
                
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
                    if (ignit) begin
                        next_state=s_disarmed;
                        start_time=0;
                     else if (~start_timer && expired) next_state=s_siren;
                     else: start_timer=0;
				end
            
            s_siren: begin
                if (ignit) next_state=s_disarmed;
					 else if (~passenger && ~driver) begin
                    interval=2'b11;
						  start_timer=1;	
						  next_state=s_door_closed_CD;
					 end
				end
				            
            s_door_closed_CD: begin  
			       start_timer=0;
                if (ignit) begin
                        next_state=s_disarmed;
                        start_timer=0;
                    end
					 else if (~start_timer && expired) next_state=s_armed;
                     else: start_timer=0;
            end
            
            s_disarmed: if(~ignit) next_state=s_tran1;
          
            s_tran1: if(driver) next_state=s_tran2;
            s_tran2: begin 
					if (~driver) begin
					   interval=2'b00;
					   start_timer=1;							
						next_state=s_tran3_CD;
					end
				end
            
            s_tran3_CD:begin
				  if(~start_timer && expired)next_state=s_armed;
                   else: start_timer=0;
				end
				/*
				default: begin
					start_timer<=0;
					next_state<=s_armed;
				end
				*/
        endcase 
    end
    always @(posedge clk) state<=next_state;


    assign siren= ( (state==s_siren) || (state==s_door_closed_CD)); 
    assign status = (state==s_armed) ?  blink: 
	 (state==s_triggered_CD || state==s_siren || state==s_door_closed_CD);
             
             
endmodule
