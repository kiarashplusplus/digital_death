module FSM (input clk, input ignit, input driver, input passenger, 
            input reprogram, input expired, output [1:0] interval, 
            output start_timer, output siren, output status);
	        
             
    parameter s_armed=0;   
    parameter s_driver_CD=1;
    parameter s_passenger_CD=2;
    parameter s_siren=3;
    parameter s_door_closed_CD=4;
    parameter s_disarmed=5;
    parameter s_tran1=6;    
    parameter s_tran2=7;
    parameter s_tran3_CD=8;
    
    reg [3:0] state, next_state;

    wire blink;
    squareWave blink_wave (.clk(clk), .square(blink));
    
    
    always @(posedge clk) begin
    
        if (reset) next_state=s_armed;
        else case (state)
        
            s_armed: begin
                
                if (ignit) next_state<=s_disarmed;
                else if (passenger) begin 
                    
                
                end else if (driver) begin
                
                end else next_state<=state;
                
            end
            
            s_passenger_CD: begin   // count down T_PASSENGER_DELAY before going to triggered.
                if (ignit) next_state<=s_disarmed;
            
            end
            
            s_driver_CD: begin // count down T_DRIVER_DELAY before going to triggered.
                if (ignit) next_state<=s_disarmed;
            
            end
            
            s_siren: next_state <= (ignit)?  s_disarmed : (passenger && driver) ? s_door_closed_CD : s_siren;
            
            s_door_closed_CD: begin  // count down T_ALARM_ON before going to armed.
                if (ignit) next_state<=s_disarmed;
            end
            
            s_disarmed: (~ignit) ? next_state<=s_tran1: next_state<=state;
          
            s_tran1: (driver) ? (next_state<=s_tran2) : next_state<=state;
            s_tran2: (~driver) ? (next_state<=s_tran3_CD) : next_state<=state;
            
            s_tran3_CD: begin  // count down T_ARM_DELAY before going to armed.
            
            end
            
        endcase 
        
    
    end
    

    assign siren= ( (state==s_siren) || (state==s_door_closed_CD) ? 1 : 0; 
    assign status = (state==s_armed) ?  blink: (state==s_passenger_CD || state==s_driver_CD || state==s_siren || state==s_door_closed_CD) ? 1 : 0;
             
             
endmodule
