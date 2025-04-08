v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 895 20 1695 420 {flags=graph
y1=-0.02
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=4e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hcursor1_y=1.0065781
color=4
node=vo}
B 2 1715 20 2515 420 {flags=graph
y1=0
y2=1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=4e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hcursor1_y=1.0065781
color=4
node=a}
B 2 1715 440 2515 840 {flags=graph
y1=0
y2=1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=4e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hcursor1_y=1.0065781
color=7
node=b}
N 140 320 140 340 {lab=A}
N 140 380 140 410 {lab=GND}
N 90 320 90 340 {lab=vdd}
N 90 400 90 410 {lab=GND}
N 140 440 140 460 {lab=B}
N 140 500 140 530 {lab=GND}
N 550 340 570 340 {lab=A}
N 550 400 570 400 {lab=B}
N 660 260 660 290 {lab=vdd}
N 660 450 660 470 {lab=GND}
N 810 370 820 370 {lab=Vo}
N 810 370 810 390 {lab=Vo}
N 800 370 810 370 {lab=Vo}
N 810 450 810 470 {lab=GND}
N 660 470 810 470 {lab=GND}
C {devices/code_shown.sym} 55 80 0 0 {name=NGSPICE only_toplevel=true 
value="
.control
tran 1u 4u 
write nand_tb.raw
.endc
"}
C {devices/code_shown.sym} 65 215 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/lab_pin.sym} 140 320 2 0 {name=p24 sig_type=std_logic lab=A}
C {devices/gnd.sym} 140 410 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 140 370 0 0 {name=V1 value="dc 0 ac 0 PULSE(0 1 0 1n 1n 2u 4u)"}
C {devices/vsource.sym} 90 370 0 1 {name=V6 value=1.2}
C {devices/gnd.sym} 90 410 0 1 {name=l11 lab=GND
value=1.2}
C {devices/lab_pin.sym} 90 320 2 1 {name=p26 sig_type=std_logic lab=vdd}
C {devices/launcher.sym} 962.5 460 0 0 {name=h1
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/nand_tb.raw tran"
}
C {devices/lab_pin.sym} 140 440 2 0 {name=p1 sig_type=std_logic lab=B}
C {devices/gnd.sym} 140 530 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 140 490 0 0 {name=V2 value="dc 0 ac 0 PULSE(0 1 0 1n 1n 1u 2u)"}
C {/home/pedersen/projects/IHP-AnalogAcademy/modules/module_3_8_bit_SAR_ADC/part_2_digital_comps/nand_gate/schematic/nand_gate.sym} 720 380 0 0 {name=x1}
C {devices/lab_pin.sym} 550 340 2 1 {name=p2 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} 550 400 2 1 {name=p3 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} 660 260 2 1 {name=p4 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 660 470 0 1 {name=l2 lab=GND
value=1.2}
C {capa.sym} 810 420 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {opin.sym} 820 370 0 0 {name=p5 lab=Vo}
