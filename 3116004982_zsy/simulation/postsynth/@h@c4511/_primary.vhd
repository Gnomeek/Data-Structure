library verilog;
use verilog.vl_types.all;
entity HC4511 is
    port(
        SM_8S_i_0_0     : out    vl_logic;
        SM_8S_i_0_1     : out    vl_logic;
        SM_8S_i_0_3     : out    vl_logic;
        Seg_c           : out    vl_logic_vector(6 downto 4);
        qaux            : in     vl_logic_vector(3 downto 0);
        N_18_i          : in     vl_logic;
        N_6             : out    vl_logic;
        N_16            : in     vl_logic
    );
end HC4511;
