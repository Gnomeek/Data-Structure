library verilog;
use verilog.vl_types.all;
entity HC161 is
    port(
        qaux            : out    vl_logic_vector(3 downto 0);
        Dn_c            : in     vl_logic_vector(3 downto 0);
        MRN_c           : in     vl_logic;
        CP_c            : in     vl_logic;
        N_16            : out    vl_logic;
        N_18_i          : out    vl_logic;
        INV_0_Y         : in     vl_logic
    );
end HC161;
