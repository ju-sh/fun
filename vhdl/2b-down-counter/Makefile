NAME = ctr

build: $(NAME).vhdl $(NAME)-tb.vhdl
	ghdl -a --std=08 $(NAME).vhdl
	ghdl -a --std=08 $(NAME)-tb.vhdl
	ghdl -e --std=08 ent_$(NAME)_tb
	#ghdl-2.0.0/ghdl_mcode -a $(NAME).vhdl
	#ghdl-2.0.0/ghdl_mcode -e ent_$(NAME)
	#ghdl-2.0.0/ghdl_mcode -a $(NAME)-tb.vhdl
	#ghdl-2.0.0/ghdl_mcode -e ent_$(NAME)_tb

PHONY: sim clean

clean:
	rm -rf dump.vcd *.cf

sim:
	ghdl -r --std=08 ent_$(NAME)_tb --vcd=dump.vcd --stop-time=500ns
	#ghdl-2.0.0/ghdl_mcode -r ent_$(NAME)_tb --vcd=dump.vcd --stop-time=100ns

vcd: dump.vcd
	vcd-x86_64-linux-gnu-220131 < dump.vcd
