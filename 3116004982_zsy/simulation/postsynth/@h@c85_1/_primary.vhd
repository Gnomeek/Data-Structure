library verilog;
use verilog.vl_types.all;
entity HC85_1 is
    port(
        DataB_c         : in     vl_logic_vector(3 downto 0);
        DataA_c         : in     vl_logic_vector(3 downto 0);
        HC85_0_QAGB     : out    vl_logic;
        HC85_0_QASB     : out    vl_logic;
        un1_DataA_NE_0  : out    vl_logic;
        un1_DataA_NE_1  : out    vl_logic
    );
end HC85_1;
