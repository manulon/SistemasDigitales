#!/bin/bash

ghdl -a fsm.vhdl tb_fsm.vhdl
ghdl -s fsm.vhdl tb_fsm.vhdl
ghdl -e tb_fsm
ghdl -r tb_fsm --vcd=tb_fsm.vcd --stop-time=1000ns
gtkwave tb_fsm.vcd

echo "Los archivos fueron generados"
