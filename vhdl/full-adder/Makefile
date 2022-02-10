build: full-adder.vhdl full-adder-tb.vhdl
	ghdl -a full-adder.vhdl
	ghdl -e fadder
	ghdl -a full-adder-tb.vhdl
	ghdl -e fadder_tb

PHONY: fun

run:
	ghdl -r fadder_tb --vcd=dump.vcd --stop-time=100ns

sim: dump.vcd
	vcd dump.vcd
