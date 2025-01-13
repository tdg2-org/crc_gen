rm -rf crc_lib 
rm -rf work

vlog  ../hdl/generic_crc.sv       -sv   -work crc_lib
vcom  ../hdl/generic_crc.vhd      -2008 -work crc_lib 
vlog  ../hdl/crc_hw_test.sv       -sv   -work crc_lib
vlog  ../hdl/tb/crc_hw_test_tb.sv -sv   -work work

vsim  -L crc_lib -vopt work.crc_hw_test_tb -voptargs=+acc

log -r /*

if {[file exists wave.do]} {do wave.do}

run 5us