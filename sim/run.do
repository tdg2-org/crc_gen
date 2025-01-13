rm -rf crc_lib 
rm -rf work

vlog -sv ../hdl/generic_crc.sv        -work crc_lib
vlog -sv ../hdl/generic_crc2.sv        -work crc_lib
vlog -sv ../hdl/generic_crc3.sv        -work crc_lib
vlog -sv ../hdl/generic_crc4.sv        -work crc_lib
vlog -sv ../hdl/generic_crc5.sv        -work crc_lib
vlog -sv ../hdl/tb/generic_crc_tb.sv  -work work

vsim  -L crc_lib -vopt work.generic_crc_tb -voptargs=+acc

log -r /*

if {[file exists wave.do]} {do wave.do}

run 5us