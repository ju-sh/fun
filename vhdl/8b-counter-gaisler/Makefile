build: 8b.vhdl 8b-tb.vhdl
	ghdl -a 8b.vhdl
	ghdl -e counter8
	#ghdl -a --std=08 8b-tb.vhdl  # VHDL2008
	ghdl -a 8b-tb.vhdl
	ghdl -e counter8_tb

PHONY: sim

sim:
	ghdl -r counter8_tb --stop-time=100ns --vcd=dump.vcd

clean: work-obj93.cf
	rm -rf work-obj93.cf dump.vcd
