v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 620 -870 1420 -470 {flags=graph
y1=-0.033
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-0.00014753886
x2=0.00114631
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
B 2 620 -460 1420 -60 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-0.00014753886
x2=0.00114631
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=vin
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
N 300 -360 300 -300 {lab=GND}
N 60 -430 60 -400 {lab=clk}
N 60 -340 60 -320 {lab=GND}
N 60 -570 60 -540 {lab=vin}
N 60 -480 60 -460 {lab=GND}
N 500 -430 510 -430 {lab=vo}
N 230 -430 270 -430 {lab=vin}
N 60 -710 60 -680 {lab=vdd}
N 60 -620 60 -600 {lab=GND}
N 420 -360 420 -290 {lab=clk}
N 360 -360 360 -290 {lab=vdd}
N 500 -340 500 -300 {lab=GND}
N 500 -430 500 -400 {lab=vo}
N 440 -430 500 -430 {lab=vo}
C {devices/code_shown.sym} 10 -40 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
"}
C {devices/code_shown.sym} 0 -250 0 0 {name=NGSPICE
only_toplevel=true
value="
.control
save all
tran 1u 1.024m
set wr_singlescale
set wr_vecnames
write test_bootstrap.raw
wrdata vout_data.txt v(vo)
.endc
" }
C {vsource.sym} 60 -370 0 0 {name=V1 value="PULSE(0 5 0 10p 10p 0.5u 1u)"}
C {gnd.sym} 60 -320 0 1 {name=l2 lab=GND}
C {lab_pin.sym} 60 -430 0 0 {name=p1 sig_type=std_logic lab=clk}
C {vsource.sym} 60 -510 0 0 {name=V2 value="SIN(0.6 0.6 12.695e3 0 0 0)"}
C {gnd.sym} 60 -460 0 1 {name=l3 lab=GND}
C {lab_pin.sym} 60 -570 0 0 {name=p2 sig_type=std_logic lab=vin}
C {iopin.sym} 510 -430 0 0 {name=p3 lab=vo}
C {lab_pin.sym} 230 -430 0 0 {name=p4 sig_type=std_logic lab=vin}
C {vsource.sym} 60 -650 0 0 {name=V3 value=1.2}
C {gnd.sym} 60 -600 0 1 {name=l4 lab=GND}
C {lab_pin.sym} 60 -710 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 420 -290 0 0 {name=p6 sig_type=std_logic lab=clk}
C {lab_pin.sym} 360 -290 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {gnd.sym} 300 -300 0 1 {name=l5 lab=GND}
C {launcher.sym} 470 -160 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/test_bootstrap.raw tran"
}
C {capa.sym} 500 -370 0 0 {name=C1
m=1
value=7p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 500 -300 0 1 {name=l1 lab=GND}
C {bootstrap_switch.sym} 340 -430 0 0 {name=x1}
