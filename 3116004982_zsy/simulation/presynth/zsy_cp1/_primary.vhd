library verilog;
use verilog.vl_types.all;
entity zsy_cp1 is
    port(
        CP              : in     vl_logic;
        dig1            : out    vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        MR              : in     vl_logic;
        B               : in     vl_logic_vector(3 downto 0);
        Y               : out    vl_logic_vector(6 downto 0);
        dig2            : out    vl_logic;
        dig3            : out    vl_logic;
        dig4            : out    vl_logic;
        dp              : out    vl_logic
    );
end zsy_cp1;
