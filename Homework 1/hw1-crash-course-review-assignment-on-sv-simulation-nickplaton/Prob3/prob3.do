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
vlog FSM.sv prob3_tb.sv

# start and run simulation
vsim -voptargs=+acc work.prob3_tb
view wave

-- display input and output signals as hexidecimal values
add wave -noupdate -divider -height 32 "Inputs"
add wave -hex -label "Clock" /prob3_tb/clk
add wave -hex -label "A" /prob3_tb/dut/a
add wave -hex -label "B" /prob3_tb/dut/b
add wave -hex -label "Reset" /prob3_tb/dut/reset
add wave -noupdate -divider -height 32 "Internal"
add wave -label "nextstate" /prob3_tb/dut/nextstate
add wave -label "state" /prob3_tb/dut/state
add wave -noupdate -divider -height 32 "Output"
add wave -hex -label "Y" /prob3_tb/dut/y
add wave -noupdate -divider -height 32 "Golden Vectors"
add wave -hex -label "Golden Y" /prob3_tb/golden_y

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
