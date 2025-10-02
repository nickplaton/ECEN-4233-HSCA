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
vlog gray_udl.sv prob6_tb.sv

# start and run simulation
vsim -voptargs=+acc work.prob6_tb
view wave

-- display input and output signals as hexidecimal values
add wave -noupdate -divider -height 32 "Input"
add wave -hex -label "Clock" /prob6_tb/clk
add wave -hex -label "Up" /prob6_tb/dut/up
add wave -hex -label "Load Enable" /prob6_tb/dut/load_en
add wave -radix binary -label "Load Value" /prob6_tb/dut/load_value
add wave -noupdate -divider -height 32 "Internal"
add wave -radix binary -label "Next Count" /prob6_tb/dut/next
add wave -noupdate -divider -height 32 "Output"
add wave -radix binary -label "Count" /prob6_tb/dut/count
add wave -noupdate -divider -height 32 "Golden Vectors"
add wave -radix binary -label "Golden Count" /prob6_tb/golden_count

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
