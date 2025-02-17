v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 20 -1225 820 -825 {flags=graph
y1=0.046228722
y2=1.0862287
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0

divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
x2=1e-06
color=4
node=clk}
B 2 20 -805 820 -405 {flags=graph
y1=0.59
y2=0.61
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0

divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
x2=1e-06


color=4
node=v+}
B 2 850 -1225 1650 -825 {flags=graph
y1=-1.3
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0

divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
x2=1e-06


color=4
node=vout}
B 2 850 -805 1650 -405 {flags=graph
y1=-0.7005027
y2=1.1959773
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0

divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
x2=1e-06

color=4
node=outp}
B 2 850 -395 1650 5 {flags=graph
y1=0.24502661
y2=1.4615386
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0

divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
x2=1e-06


color=4
node=outm}
N -540 -180 -540 -160 {
lab=vbias}
N -610 -180 -610 -160 {
lab=vdd}
N -610 -100 -610 -80 {
lab=GND}
N -570 -80 -540 -80 {
lab=GND}
N -420 -180 -420 -160 {
lab=clk}
N -420 -100 -420 -70 {
lab=GND}
N -570 -80 -570 -70 {
lab=GND}
N -420 -70 -210 -70 {
lab=GND}
N -210 -100 -210 -70 {
lab=GND}
N -210 -180 -210 -160 {
lab=vinp}
N 60 -220 120 -220 {
lab=vbias}
N 200 -120 200 -90 {
lab=GND}
N 250 -140 250 -110 {
lab=clk}
N 200 -350 200 -320 {
lab=vdd}
N 400 -210 500 -210 {
lab=outm}
N 400 -230 500 -230 {
lab=outp}
N 80 -160 120 -160 {
lab=vbias}
N 80 -280 120 -280 {
lab=vinp}
N -610 -80 -570 -80 {
lab=GND}
N -540 -100 -540 -80 {
lab=GND}
N 80 -300 80 -280 {
lab=vinp}
N 60 -280 80 -280 {
lab=vinp}
N 80 -160 80 -140 {
lab=vbias}
N 60 -160 80 -160 {
lab=vbias}
N 80 -80 80 -60 {
lab=GND}
N 80 -380 80 -360 {
lab=GND}
N 460 -150 460 -140 {
lab=GND}
N 460 -300 460 -290 {
lab=GND}
C {devices/code_shown.sym} -675 -490 0 0 {name=MODEL only_toplevel=false
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} -685 -780 0 0 {name=NGSPICE only_toplevel=false 
value="
.control
op
.param clock = 100e6    ; 100 MHz clock
.param period = 1 / clock
.param num_cycles = 100  ; number of evaluation cycles
.param tr = num_cycles * period
tran 500p 1u
.save all
let vindiff = (v(vinp))-(v(vbias))
let clk = v(clk)
let vout = (v(outp))-(v(outm))
write output_file.raw
.endc
"}
C {launcher.sym} -160 -855 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/output_file.raw tran"
}
C {vsource.sym} -610 -130 0 0 {name=V3 value="DC 1.2"}
C {vsource.sym} -540 -130 0 0 {name=V4 value="DC 0.6"}
C {gnd.sym} -310 -70 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -540 -180 2 0 {name=p3 sig_type=std_logic lab=vbias}
C {lab_pin.sym} -610 -180 2 0 {name=p4 sig_type=std_logic lab=vdd}
C {vsource.sym} -420 -130 0 0 {name=V1 value="PULSE(0 1.2 0 0 0 5N \{period\})"}
C {lab_pin.sym} -420 -180 2 0 {name=p1 sig_type=std_logic lab=clk}
C {gnd.sym} -570 -70 0 0 {name=l2 lab=GND}
C {vsource.sym} -210 -130 0 0 {name=V2 value="PULSE(595e-3 605e-3 0 tr 1S 1S)"}
C {lab_pin.sym} -210 -180 2 0 {name=p2 sig_type=std_logic lab=vinp}
C {/home/pedersen/projects/IHP-AnalogAcademy/modules/module_3_8_bit_SAR_ADC/part_1_comparator/schematic/dynamic_comparator.sym} 270 -220 0 0 {name=x1}
C {lab_pin.sym} 60 -280 2 1 {name=p5 sig_type=std_logic lab=vinp}
C {lab_pin.sym} 200 -350 2 0 {name=p6 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 60 -220 2 1 {name=p7 sig_type=std_logic lab=vbias}
C {lab_pin.sym} 60 -160 2 1 {name=p8 sig_type=std_logic lab=vbias}
C {lab_pin.sym} 250 -110 2 0 {name=p9 sig_type=std_logic lab=clk}
C {gnd.sym} 200 -90 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 500 -230 2 0 {name=p10 sig_type=std_logic lab=outp}
C {lab_pin.sym} 500 -210 2 0 {name=p11 sig_type=std_logic lab=outm}
C {capa.sym} 80 -110 0 0 {name=C1
m=1
value=16.384p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 80 -60 0 0 {name=l4 lab=GND}
C {gnd.sym} 80 -380 2 0 {name=l5 lab=GND}
C {capa.sym} 80 -330 2 0 {name=C2
m=1
value=16.384p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 460 -260 2 0 {name=C4
m=1
value=15f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 460 -180 0 0 {name=C3
m=1
value=15f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 460 -140 0 0 {name=l6 lab=GND}
C {gnd.sym} 460 -300 2 0 {name=l7 lab=GND}
