library verilog;
use verilog.vl_types.all;
entity SirenGen is
    generic(
        mhz             : integer := 27000000
    );
    port(
        clk             : in     vl_logic;
        speaker         : out    vl_logic
    );
end SirenGen;
