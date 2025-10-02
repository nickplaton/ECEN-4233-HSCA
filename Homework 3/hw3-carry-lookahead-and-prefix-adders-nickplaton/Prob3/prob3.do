# Copyright 1991-2016 Mentor Graphics Corporation
# 
# Modification by Oklahoma State University
# Use with Testbench 
# James Stine, 2008
# Go Cowboys!!!!!!
#
# All Rights Reserved.
#
# THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION
# OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
# Use this run.do file to run this example.
# Either bring up ModelSim and type the following at the "ModelSim>" prompt:
#     do run.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run.do -c
# (omit the "-c" to see the GUI while running from the shell)
onbreak {resume}
# create library
if [file exists work] {
    vdel -all
}
vlib work
# compile source files
vlog bclg4.sv cla64.sv fa.sv prob3_tb.sv rca64.sv rfa.sv

# start and run simulation
vsim -voptargs=+acc work.prob3_tb
view wave

-- display input and output signals as hexidecimal values
add wave -noupdate -divider -height 32 "Input"
add wave -hex -label "A" /prob3_tb/a
add wave -hex -label "B" /prob3_tb/b
add wave -noupdate -divider -height 32 "Internal"
add wave -hex -label "CLA C" /prob3_tb/cla_dut/c
add wave -hex -label "RCA C" /prob3_tb/rca_dut/c
add wave -noupdate -divider -height 32 "Output"
add wave -hex -label "CLA Cout" /prob3_tb/cout_cla
add wave -hex -label "CLA Sum" /prob3_tb/Sum_cla
add wave -hex -label "RCA Cout" /prob3_tb/cout_rca
add wave -hex -label "RCA Sum" /prob3_tb/Sum_rca
add wave -noupdate -divider -height 32 "Golden Vectors"
add wave -hex -label "Golden Sum" /prob3_tb/golden_sum

-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 350
configure wave -valuecolwidth 200
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation 
run 1000 ns
quit
