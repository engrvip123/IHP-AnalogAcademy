v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 760 -750 1560 -350 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.0001
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=control
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 760 -1160 1560 -760 {flags=graph
y1=0.6
y2=0.62
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.0001
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color=4
node=vref}
B 2 1590 -750 2390 -350 {flags=graph
y1=-0.0006
y2=0.61
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.0001
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=vo
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
N 40 -630 40 -600 {lab=vref}
N 40 -540 40 -510 {lab=GND}
N 40 -480 40 -450 {lab=Control}
N 40 -390 40 -360 {lab=GND}
N 40 -780 40 -750 {lab=vdd}
N 40 -690 40 -660 {lab=GND}
N 400 -610 400 -580 {lab=Control}
N 480 -690 540 -690 {lab=Vo}
N 400 -940 400 -770 {lab=#net1}
N 480 -1020 540 -1020 {lab=Vo}
N 540 -860 540 -690 {lab=Vo}
N 570 -860 590 -860 {lab=Vo}
N 540 -1020 540 -860 {lab=Vo}
N 400 -1170 400 -1100 {lab=Control}
N 190 -1170 400 -1170 {lab=Control}
N 190 -1170 190 -850 {lab=Control}
N 190 -850 220 -850 {lab=Control}
N 260 -690 320 -690 {lab=GND}
N 260 -640 320 -640 {lab=GND}
N 260 -730 320 -730 {lab=vdd}
N 190 -850 190 -580 {lab=Control}
N 190 -580 400 -580 {lab=Control}
N 260 -1020 320 -1020 {lab=vref}
N 260 -970 320 -970 {lab=GND}
N 260 -1060 320 -1060 {lab=vdd}
N 150 -850 190 -850 {lab=Control}
N 260 -920 260 -910 {lab=vdd}
N 260 -790 260 -780 {lab=GND}
N 570 -860 570 -840 {lab=Vo}
N 540 -860 570 -860 {lab=Vo}
N 570 -780 570 -770 {lab=GND}
C {vsource.sym} 40 -570 0 0 {name=V1 value=0.6}
C {vsource.sym} 40 -420 0 0 {name=V2 value="PULSE(0 1.2 0 1u 1u 10u 20u)"}
C {devices/code_shown.sym} 250 -540 0 0 {name=NGSPICE
only_toplevel=true
value="
.control
save all
tran 1u 100u
write T_gate_tb.raw
.endc
" }
C {devices/code_shown.sym} 240 -370 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {gnd.sym} 40 -360 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 40 -630 0 0 {name=p1 sig_type=std_logic lab=vref}
C {lab_pin.sym} 40 -480 0 0 {name=p2 sig_type=std_logic lab=Control}
C {gnd.sym} 40 -510 0 0 {name=l2 lab=GND}
C {vsource.sym} 40 -720 0 0 {name=V3 value=1.2}
C {lab_pin.sym} 40 -780 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {gnd.sym} 40 -660 0 0 {name=l3 lab=GND}
C {iopin.sym} 590 -860 0 0 {name=p5 lab=Vo}
C {launcher.sym} 820 -310 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/T_gate_tb.raw tran"
}
C {gnd.sym} 260 -690 0 0 {name=l5 lab=GND}
C {gnd.sym} 260 -640 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 260 -730 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {gnd.sym} 260 -970 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 260 -1060 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 260 -1020 0 0 {name=p8 sig_type=std_logic lab=vref}
C {lab_pin.sym} 150 -850 0 0 {name=p9 sig_type=std_logic lab=Control}
C {lab_pin.sym} 260 -920 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {gnd.sym} 260 -780 0 0 {name=l4 lab=GND}
C {capa.sym} 570 -810 0 0 {name=C1
m=1
value=7p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 570 -770 0 0 {name=l7 lab=GND}
C {inverter.sym} 240 -850 0 0 {name=x1}
C {T_gate.sym} 400 -1020 0 0 {name=x2}
C {T_gate.sym} 400 -690 0 0 {name=x3}
