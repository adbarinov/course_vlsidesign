transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {uart.svo}

vlog -sv -work work +incdir+/home/abarinov/MyProject/ASIC/uart/test {/home/abarinov/MyProject/ASIC/uart/test/tb_tx.sv}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb_tx

add wave *
view structure
view signals
run -all
