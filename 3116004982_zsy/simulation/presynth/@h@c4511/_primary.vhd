library verilog;
use verilog.vl_types.all;
entity HC4511 is
    port(
        LE              : in     vl_logic;
        BI              : in     vl_logic;
        LT              : in     vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        Y               : out    vl_logic_vector(6 downto 0)
    );
end HC4511;
