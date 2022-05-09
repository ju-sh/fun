NAME = ctr

build: $(NAME).vhdl $(NAME)-tb.vhdl
	ghdl -a --std=08 $(NAME).vhdl
	ghdl -a --std=08 $(NAME)-tb.vhdl
	ghdl -e --std=08 ent_$(NAME)_tb

PHONY: sim clean

clean:
	rm -rf dump.vcd *.cf

sim:
	ghdl -r --std=08 ent_$(NAME)_tb --vcd=dump.vcd --stop-time=500ns

vcd: dump.vcd
	~/Downloads/vcd-x86_64-linux-gnu-220131/vcd-x86_64-linux-gnu-220131 < dump.vcd
