NAME = ctr

build: $(NAME).vhdl $(NAME)-tb.vhdl
	ghdl -a $(NAME).vhdl
	ghdl -e ent_$(NAME)
	ghdl -a $(NAME)-tb.vhdl
	ghdl -e ent_$(NAME)_tb
#	/home/famubu/Downloads/ghdl-2.0.0/ghdl_mcode -a $(NAME).vhdl
#	/home/famubu/Downloads/ghdl-2.0.0/ghdl_mcode -e ent_$(NAME)
#	/home/famubu/Downloads/ghdl-2.0.0/ghdl_mcode -a $(NAME)-tb.vhdl
#	/home/famubu/Downloads/ghdl-2.0.0/ghdl_mcode -e ent_$(NAME)_tb

PHONY: sim clean

clean:
	rm -rf dump.vcd *.cf

sim:
	/home/famubu/Downloads/ghdl-2.0.0/ghdl_mcode -r ent_$(NAME)_tb --vcd=dump.vcd --stop-time=100ns

vcd: dump.vcd
	~/Downloads/vcd-x86_64-linux-gnu-220131 < dump.vcd
