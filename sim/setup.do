
#vmap -c 
if {![file exists modelsim.ini]} {vmap -c }

vlib crc_lib 
vlib work 

vmap crc_lib crc_lib
vmap work work

vsim -do run.do 


#vlog -sv top_tb.sv -work work  

#vcom generic_crc.vhd -work crc_lib 
#vcom generic_crc_tb.vhd -work work

#do wave.do


# vsim 
# vsim -c #command line mode
# vsim -do run.do 
# vsim -c -do run.do 

# vsim -voptargs=”+acc”
# vsim -batch

# log -r /*