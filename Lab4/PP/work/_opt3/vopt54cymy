library verilog;
use verilog.vl_types.all;
entity FSM is
    generic(
        s_armed         : integer := 0;
        s_triggered_CD  : integer := 1;
        s_siren         : integer := 2;
        s_door_closed_CD: integer := 3;
        s_disarmed      : integer := 4;
        s_tran1         : integer := 5;
        s_tran2         : integer := 6;
        s_tran3_CD      : integer := 7
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ignit           : in     vl_logic;
        driver          : in     vl_logic;
        passenger       : in     vl_logic;
        reprogram       : in     vl_logic;
        expired         : in     vl_logic;
        interval        : out    vl_logic_vector(1 downto 0);
        start_timer     : out    vl_logic;
        siren           : out    vl_logic;
        status          : out    vl_logic;
        current_state   : out    vl_logic_vector(2 downto 0)
    );
end FSM;
