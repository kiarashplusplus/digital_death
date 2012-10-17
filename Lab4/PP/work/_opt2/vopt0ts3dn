library verilog;
use verilog.vl_types.all;
entity timeParam is
    generic(
        T_ARM_DELAY     : integer := 6;
        T_DRIVER_DELAY  : integer := 8;
        T_PASSENGER_DELAY: integer := 15;
        T_ALARM_ON      : integer := 10
    );
    port(
        clk             : in     vl_logic;
        Time_Parameter_Selector: in     vl_logic_vector(1 downto 0);
        Time_Value      : in     vl_logic_vector(3 downto 0);
        Reprogram       : in     vl_logic;
        reset           : in     vl_logic;
        interval        : in     vl_logic_vector(1 downto 0);
        value           : out    vl_logic_vector(3 downto 0)
    );
end timeParam;
