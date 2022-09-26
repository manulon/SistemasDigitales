#!/bin/bash

ghdl -a contador.vhdl tb_contador.vhdl
ghdl -s contador.vhdl tb_contador.vhdl
ghdl -e tb_contador
ghdl -r tb_contador --vcd=tb_contador.vcd --stop-time=1000ns
gtkwave tb_contador.vcd

echo "Los archivos fueron generados"
