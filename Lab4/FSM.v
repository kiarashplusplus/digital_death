module FSM (input clk, input ignit, input driver, input passenger, 
            input reprogram, input expired, output [1:0] interval, 
            output start_timer, output siren, output status);
	        
             
    parameter s_armed=0;   
    parameter s_triggered_CD=1;
    parameter s_siren=2;
    parameter s_door_closed_CD=3;
    parameter s_disarmed=4;
    parameter s_tran1=5;    
    parameter s_tran2=6;
    parameter s_tran3_CD=7;
    
    reg [3:0] state, next_state;

    wire blink;
    squareWave blink_wave (.clk(clk), .square(blink));
    
    
    always @(posedge clk) begin
    
        if (reset) next_state=s_armed;
        else case (state)
        
            s_armed: begin
                
                if (ignit) next_state<=s_disarmed;
                else if (passenger) begin 
                    interval<=2'b10;
						  start_timer<=1;
						  next_state<=s_triggered_CD;
                
                end else if (driver) begin
                    interval<=2'b01;
						  start_timer<=1;					 
						  next_state<=s_triggered_CD;
                
                end else next_state<=state;
                
            end
            
            
            s_triggered_CD: begin 
                if (ignit) next_state<=s_disarmed;
					 else if (start_timer) start_timer<=0;
					 else if (expired) next_state<=s_siren;
				end
            
            s_siren: begin
                if (ignit) next_state<=s_disarmed;
					 else if (passenger && driver) begin
                    interval<=2'b11;
						  start_timer<=1;								
					 end
				end
				            
            s_door_closed_CD: begin  
                if (ignit) next_state<=s_disarmed;
					 else if (start_timer) start_timer<=0;
					 else if (expired) next_state<=s_armed;
            end
            
            s_disarmed: (~ignit) ? next_state<=s_tran1: next_state<=state;
          
            s_tran1: (driver) ? (next_state<=s_tran2) : next_state<=state;
            s_tran2: begin 
					if (~driver) begin
					   interval<=2'b00;
					   start_timer<=1;							
						next_state<=s_tran3_CD
					end
				end
            
            s_tran3_CD: if(expired)next_state<=s_armed;

        endcase 
        
    
    end
    

    assign siren= ( (state==s_siren) || (state==s_door_closed_CD) ? 1 : 0; 
    assign status = (state==s_armed) ?  blink: (state==s_triggered_CD || state==s_siren || state==s_door_closed_CD) ? 1 : 0;
             
             
endmodule
