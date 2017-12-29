library verilog;
use verilog.vl_types.all;
entity HC161 is
    port(
        MR              : in     vl_logic;
        CP              : in     vl_logic;
        CEP             : in     vl_logic;
        CET             : in     vl_logic;
        PE              : in     vl_logic;
        D               : in     vl_logic_vector(3 downto 0);
        Q               : out    vl_logic_vector(3 downto 0);
        TC              : out    vl_logic
    );
end HC161;
