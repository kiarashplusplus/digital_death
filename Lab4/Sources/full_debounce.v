module full_debounce (input reset, input clk, input brake, output clean_break, 
                      input hidden, output clean_hidden, input rst, output clean_rst,
                      input driver, output clean_driver, input passenger, output clean_passenger, input reprogram, output clean_reprogram);
                     
    //using an instance of the debounce module for each input.
    debounce d_brake (reset, clk, brake, clean_break);
    debounce d_hidden (reset, clk, hidden, clean_hidden);
    debounce d_ignit (reset, clk, rst, clean_rst);
    debounce d_driver (reset, clk, driver, clean_driver);
    debounce d_passenger (reset, clk, passenger, clean_passenger);
    debounce d_reprogram (reset, clk, reprogram, clean_reprogram);
                                      
                      
endmodule

