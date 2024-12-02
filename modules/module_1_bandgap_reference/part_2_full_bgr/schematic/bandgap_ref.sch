v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 270 -480 500 -480 {
lab=#net1}
N 540 -480 550 -480 {
lab=vdd}
N 550 -510 550 -480 {
lab=vdd}
N 540 -510 550 -510 {
lab=vdd}
N 500 -480 500 -470 {
lab=#net1}
N 500 -470 740 -470 {
lab=#net1}
N 740 -480 740 -470 {
lab=#net1}
N 230 -530 230 -480 {
lab=vdd}
N 540 -530 780 -530 {
lab=vdd}
N 780 -530 780 -480 {
lab=vdd}
N 540 -530 540 -510 {
lab=vdd}
N 230 -530 540 -530 {
lab=vdd}
N 780 -450 780 -410 {
lab=VBG}
N 780 -410 870 -410 {
lab=VBG}
N 780 -410 780 -380 {
lab=VBG}
N 780 -530 870 -530 {
lab=vdd}
N 540 -450 540 -280 {
lab=#net2}
N 430 -280 540 -280 {
lab=#net2}
N 230 -280 350 -280 {
lab=#net3}
N 230 -450 230 -280 {
lab=#net3}
N 230 -280 230 -160 {
lab=#net3}
N 140 -280 230 -280 {
lab=#net3}
N 140 -220 140 -200 {
lab=GND}
N 780 -320 780 -300 {
lab=GND}
N 540 -280 640 -280 {
lab=#net2}
N 640 -220 640 -200 {
lab=GND}
N 540 -220 540 -160 {
lab=#net4}
N 230 -100 230 -70 {
lab=GND}
N 190 -130 190 -70 {
lab=GND}
N 500 -130 500 -70 {
lab=GND}
N 540 -100 540 -70 {
lab=GND}
C {sg13g2_pr/sg13_lv_pmos.sym} 250 -480 0 1 {name=M3
l=0.6u
w=65u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 520 -480 0 0 {name=M4
l=0.6u
w=65u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {/home/pedersen/projects/IHP-AnalogAcademy/modules/module_1_bandgap_reference/part_2_full_bgr/schematic/verilog/veriloga_tbs/diff_amp.sym} 390 -380 1 1 {name=U1 model=diff_amp_cell spiceprefix=X}
C {sg13g2_pr/sg13_lv_pmos.sym} 760 -480 0 0 {name=M5
l=0.6u
w=65u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {opin.sym} 870 -410 0 0 {name=p1 lab=VBG}
C {res.sym} 780 -350 0 0 {name=R4
value=16k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 870 -530 0 1 {name=p2 sig_type=std_logic lab=vdd}
C {res.sym} 140 -250 0 0 {name=R3
value=45k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 140 -200 0 0 {name=l1 lab=GND}
C {gnd.sym} 780 -300 0 0 {name=l2 lab=GND}
C {res.sym} 540 -250 0 0 {name=R1
value=2.145k
footprint=1206
device=resistor
m=1}
C {res.sym} 640 -250 0 0 {name=R2
value=45k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 640 -200 0 0 {name=l3 lab=GND}
C {sg13g2_pr/pnpMPA.sym} 210 -130 0 0 {name=Q1
model=pnpMPA
spiceprefix=X
w=5.0u
l=5.0u
}
C {sg13g2_pr/pnpMPA.sym} 520 -130 0 0 {name=Q2
model=pnpMPA
spiceprefix=X
w=40.0u
l=5.0u
}
C {gnd.sym} 540 -70 0 0 {name=l4 lab=GND}
C {gnd.sym} 500 -70 0 0 {name=l5 lab=GND}
C {gnd.sym} 230 -70 0 0 {name=l6 lab=GND}
C {gnd.sym} 190 -70 0 0 {name=l7 lab=GND}
C {devices/code_shown.sym} -430 -260 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerHBT.lib hbt_typ
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} -450 -520 0 0 {name=NGSPICE1 DC Vbe Sim only_toplevel=true 
value="
.control
.save all
op
dc TEMP -50 100 5
set wr_singlescale
set wr_vecnames
wrdata vbe_tempvar.txt VBG
.endc

"}
