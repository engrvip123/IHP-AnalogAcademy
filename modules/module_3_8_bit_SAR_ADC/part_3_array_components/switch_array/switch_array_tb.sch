v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 1960 -1930 2760 -1530 {flags=graph
y1=-0.0024
y2=0.61
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="1
2
3
4
5
6
7
8"
color="8 4 4 4 4 4 4 4"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1950 -1480 2750 -1080 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color=4
node=clk_comp}
N 1480 -1480 1480 -1420 {lab=vref}
N 1270 -1480 1270 -1420 {lab=1}
N 1300 -1480 1300 -1420 {lab=2}
N 1330 -1480 1330 -1420 {lab=3}
N 1360 -1480 1360 -1420 {lab=4}
N 1390 -1480 1390 -1420 {lab=5}
N 1420 -1480 1420 -1420 {lab=6}
N 1450 -1480 1450 -1420 {lab=7}
N 1510 -1600 1550 -1600 {lab=vdd}
N 1490 -1620 1490 -1600 {lab=GND}
N 1490 -1620 1610 -1620 {lab=GND}
N 980 -1730 980 -1710 {lab=clk_comp}
N 980 -1670 980 -1640 {lab=GND}
N 980 -1600 980 -1580 {lab=vdd}
N 980 -1540 980 -1510 {lab=GND}
N 980 -1460 980 -1440 {lab=vref}
N 980 -1400 980 -1370 {lab=GND}
N 1440 -1730 1470 -1730 {lab=clk_comp}
N 1470 -1730 1470 -1600 {lab=clk_comp}
N 1440 -1730 1440 -1600 {lab=clk_comp}
N 1410 -1730 1440 -1730 {lab=clk_comp}
N 1410 -1730 1410 -1600 {lab=clk_comp}
N 1380 -1730 1410 -1730 {lab=clk_comp}
N 1380 -1730 1380 -1600 {lab=clk_comp}
N 1350 -1730 1380 -1730 {lab=clk_comp}
N 1350 -1730 1350 -1600 {lab=clk_comp}
N 1320 -1730 1350 -1730 {lab=clk_comp}
N 1320 -1730 1320 -1600 {lab=clk_comp}
N 1280 -1730 1280 -1600 {lab=clk_comp}
N 1280 -1730 1320 -1730 {lab=clk_comp}
N 980 -1730 1280 -1730 {lab=clk_comp}
N 1190 -1360 1220 -1360 {lab=vdd}
N 1540 -1360 1590 -1360 {lab=vo}
C {devices/lab_pin.sym} 1550 -1600 2 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 1480 -1450 2 0 {name=p8 sig_type=std_logic lab=vref}
C {gnd.sym} 1610 -1620 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 1270 -1440 0 0 {name=p77 sig_type=std_logic lab=1}
C {devices/lab_pin.sym} 1300 -1440 0 0 {name=p78 sig_type=std_logic lab=2}
C {devices/lab_pin.sym} 1330 -1440 0 0 {name=p79 sig_type=std_logic lab=3}
C {devices/lab_pin.sym} 1360 -1440 0 0 {name=p80 sig_type=std_logic lab=4}
C {devices/lab_pin.sym} 1390 -1440 0 0 {name=p81 sig_type=std_logic lab=5}
C {devices/lab_pin.sym} 1420 -1440 0 0 {name=p82 sig_type=std_logic lab=6}
C {devices/lab_pin.sym} 1450 -1440 0 0 {name=p83 sig_type=std_logic lab=7}
C {devices/lab_pin.sym} 980 -1730 2 0 {name=p24 sig_type=std_logic lab=clk_comp}
C {devices/gnd.sym} 980 -1640 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 980 -1680 0 0 {name=V1 value="dc 0 ac 0 PULSE(0 1.2 0 1n 1n 31.25n 62.5n)"}
C {devices/code_shown.sym} 970 -1310 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
tran 1n 100n
save all 
write switch_array_tb.raw
.endc
"}
C {devices/lab_pin.sym} 980 -1600 2 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 980 -1510 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 980 -1460 2 0 {name=p2 sig_type=std_logic lab=vref}
C {devices/gnd.sym} 980 -1370 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 980 -1410 0 0 {name=V3 value=0.6}
C {launcher.sym} 2010 -1510 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/switch_array_tb.raw tran"
}
C {devices/lab_pin.sym} 980 -1600 2 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 980 -1510 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 980 -1550 0 0 {name=V4 value=1.2}
C {devices/lab_pin.sym} 1590 -1360 2 0 {name=p4 sig_type=std_logic lab=vo}
C {devices/code_shown.sym} 940 -1060 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
"}
C {devices/lab_pin.sym} 1190 -1360 2 1 {name=p5 sig_type=std_logic lab=vdd}
C {switch_array.sym} 1380 -1540 2 1 {name=x1}
C {C-DAC.sym} 1370 -1360 2 1 {name=x2}
