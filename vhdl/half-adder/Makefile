build: hadder.vhdl hadder_tb.vhdl
	ghdl -a hadder.vhdl
	ghdl -e hadder
	ghdl -a hadder_tb.vhdl
	ghdl -e hadder_tb

PHONY: run

run:
	ghdl -r hadder_tb --vcd=dump.vcd --stop-time=50ns

sim: dump.vcd
	vcd-x86_64-linux-gnu-220131 < dump.vcd
