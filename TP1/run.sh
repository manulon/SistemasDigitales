#!/bin/bash

ghdl -a contador.vhdl fsm.vhdl tb_semaforo.vhdl
ghdl -s contador.vhdl fsm.vhdl tb_semaforo.vhdl
ghdl -e tb_semaforo
ghdl -r tb_semaforo --vcd=tb_semaforo.vcd --stop-time=1000ns
gtkwave tb_semaforo.vcd

echo "Los archivos fueron generados"
