build: ctr.vhdl ctr_tb.vhdl
	ghdl -a ctr.vhdl
	ghdl -e counter
	ghdl -a ctr_tb.vhdl
	ghdl -e counter_tb

wave: dump.vcd
	vcd < dump.vcd
	#gtkwave dump.vcd

PHONY: sim

sim:
	ghdl -r counter_tb --stop-time=100ns --vcd=dump.vcd
