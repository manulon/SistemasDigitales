#!/bin/bash

ghdl -a fsm.vhdl tb_fsm.vhdl contador.vhdl
echo "Listo paso 1"

ghdl -s fsm.vhdl tb_fsm.vhdl contador.vhdl 
echo "Listo paso 2"

ghdl -e tb_fsm 
echo "Listo paso 3"

ghdl -r tb_fsm  --vcd=tb_fsm.vcd --stop-time=1000ns
echo "Listo paso 4"

gtkwave tb_fsm.vcd

echo "Los archivos fueron generados"
