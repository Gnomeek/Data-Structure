library verilog;
use verilog.vl_types.all;
entity compare_8 is
    port(
        DataA           : in     vl_logic_vector(3 downto 0);
        DataB           : in     vl_logic_vector(3 downto 0);
        DataA_0         : in     vl_logic_vector(3 downto 0);
        DataB_0         : in     vl_logic_vector(3 downto 0);
        QAEB            : out    vl_logic;
        QAGB            : out    vl_logic;
        QASB            : out    vl_logic
    );
end compare_8;
