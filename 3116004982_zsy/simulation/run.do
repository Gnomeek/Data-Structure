quietly set ACTELLIBNAME proasic3
quietly set PROJECT_DIR "C:/Actelprj/3116004982_zsy"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "C:/Actel/Libero_v9.0/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -work presynth "${PROJECT_DIR}/hdl/HC85.v"
vlog -work presynth "${PROJECT_DIR}/hdl/HC4511.v"
vlog -work presynth "${PROJECT_DIR}/hdl/HC161.v"
vlog -work presynth "${PROJECT_DIR}/component/work/zsy_cp1/zsy_cp1.v"
vlog -work presynth "${PROJECT_DIR}/hdl/test_cp1.v"

vsim -L proasic3 -L presynth  -t 1ps presynth.test
# The following lines are commented because no testbench is associated with the project
# add wave /test/*
# run 1000ns
