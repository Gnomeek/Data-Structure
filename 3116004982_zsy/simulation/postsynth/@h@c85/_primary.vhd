library verilog;
use verilog.vl_types.all;
entity HC85 is
    port(
        qaux            : in     vl_logic_vector(3 downto 0);
        DataB_c         : in     vl_logic_vector(3 downto 0);
        INV_0_Y         : out    vl_logic
    );
end HC85;
