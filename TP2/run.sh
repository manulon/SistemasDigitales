#!/bin/bash

ghdl -a multiplicador.vhdl tb_multiplicador.vhdl 
echo "Listo paso 1"

ghdl -s multiplicador.vhdl tb_multiplicador.vhdl 
echo "Listo paso 2"

ghdl -e tb_multiplicador 
echo "Listo paso 3"

ghdl -r tb_multiplicador  --vcd=tb_multiplicador.vcd --stop-time=1000ns
echo "Listo paso 4"

gtkwave tb_multiplicador.vcd

echo "Los archivos fueron generados"
