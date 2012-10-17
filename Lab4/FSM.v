module FSM (input clk, input ignit, input driver, input passenger, 
            input reprogram, input expired, output [1:0] interval, 
            output start_timer, output siren, output status);
	        
             
    parameter s_armed=0;   
    parameter s_armed_CD=1;
    parameter s_timer_high=2;
    parameter s_trigger_CD=3;
    parameter s_siren=4;
    parameter s_door_closed_CD=5;
    parameter s_disarmed=6;
    parameter s_=7;    
             
    reg [3:0] state, next_state;

    always @(posedge clk) begin
    
        if (reset) next_state=s_armed;
        else case (state)
            
            s_armed: next_state= disarmed ? ignit : (passenger || driver) ? s_armed_CD : state;
            
    
    
    
    end
             
             
endmodule
