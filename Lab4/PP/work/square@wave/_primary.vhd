library verilog;
use verilog.vl_types.all;
entity squareWave is
    generic(
        mhz             : integer := 27000000
    );
    port(
        clk             : in     vl_logic;
        square          : out    vl_logic
    );
end squareWave;
