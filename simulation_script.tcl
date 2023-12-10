transcript on

# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
# vlib rtl_work
# vmap work rtl_work
vmap work

vlog -sv -work work dff.sv
vlog -sv -work work tb_dff.sv

set TOP_LEVEL_NAME tb_dff

vsim -L work -voptargs="+acc"  tb_dff

add wave *
view structure
view signals
run -all