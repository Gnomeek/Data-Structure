library verilog;
use verilog.vl_types.all;
entity zsy_cp1 is
    port(
        CP              : in     vl_logic;
        MRN             : in     vl_logic;
        Dn              : in     vl_logic_vector(3 downto 0);
        DataB           : in     vl_logic_vector(3 downto 0);
        Seg             : out    vl_logic_vector(6 downto 0)
    );
end zsy_cp1;
