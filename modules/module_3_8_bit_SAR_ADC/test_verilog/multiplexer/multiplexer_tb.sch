v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 440 -710 1240 -310 {flags=graph

y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-07
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=3.7e-06
rainbow=0

color="4 4 4 4 4 4 4 4"
node="v_in1
v_in2
v_in3
v_in4
v_in5
v_in6
v_in7
v_in8"}
B 2 440 -1140 1240 -740 {flags=graph

y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-07
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0
rainbow=0



color="4 7"
node="en1_n
en1_p"}
B 2 440 -290 1240 110 {flags=graph

y2=0.9
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-07
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0.3
rainbow=0

color=9
node=v_out}
N -150 -780 -150 -760 {
lab=GND}
N 250 -110 250 -90 {
lab=V_out}
N -150 -880 -150 -840 {
lab=Vdd}
N 250 -140 250 -110 {
lab=V_out}
N 150 -110 250 -110 {
lab=V_out}
N 0 -380 0 -370 {
lab=#net1}
N 0 -450 0 -440 {
lab=Vdd}
N 0 150 -0 160 {
lab=GND}
N -650 230 -650 250 {
lab=GND}
N -650 160 -650 170 {
lab=en1_p}
N -730 230 -730 250 {
lab=GND}
N -730 160 -730 170 {
lab=en1_n}
N -580 230 -580 250 {
lab=GND}
N -580 160 -580 170 {
lab=V_in1}
N -650 50 -650 70 {
lab=GND}
N -730 50 -730 70 {
lab=GND}
N -580 50 -580 70 {
lab=GND}
N -650 -130 -650 -110 {
lab=GND}
N -730 -130 -730 -110 {
lab=GND}
N -580 -130 -580 -110 {
lab=GND}
N -650 -310 -650 -290 {
lab=GND}
N -730 -310 -730 -290 {
lab=GND}
N -580 -310 -580 -290 {
lab=GND}
N -650 -490 -650 -470 {
lab=GND}
N -730 -490 -730 -470 {
lab=GND}
N -580 -490 -580 -470 {
lab=GND}
N -650 -670 -650 -650 {
lab=GND}
N -730 -670 -730 -650 {
lab=GND}
N -580 -670 -580 -650 {
lab=GND}
N -650 -850 -650 -830 {
lab=GND}
N -730 -850 -730 -830 {
lab=GND}
N -580 -850 -580 -830 {
lab=GND}
N -650 -1020 -650 -1000 {
lab=GND}
N -730 -1020 -730 -1000 {
lab=GND}
N -580 -1020 -580 -1000 {
lab=GND}
C {devices/code_shown.sym} -150 -1100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} 120 -1100 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 100p 120n
write tran_res_temp.raw
.endc
"}
C {devices/vsource.sym} -150 -810 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 510 150 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tran_res_temp.raw tran"
}
C {devices/gnd.sym} 0 160 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 0 -410 0 0 {name=Vp}
C {devices/gnd.sym} -150 -760 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 250 -140 1 0 {name=p3 sig_type=std_logic lab=V_out}
C {devices/capa.sym} 250 -60 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 250 -30 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -150 -880 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} 0 -450 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -150 80 0 0 {name=p7 sig_type=std_logic lab=V_in1}
C {devices/lab_pin.sym} -150 120 0 0 {name=p8 sig_type=std_logic lab=en1_p}
C {devices/lab_pin.sym} -150 100 0 0 {name=p9 sig_type=std_logic lab=en1_n}
C {multiplexer.sym} 0 -110 0 0 {name=x1}
C {devices/vsource.sym} -650 200 0 0 {name=Ven2 value=0}
C {devices/gnd.sym} -650 250 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -650 160 1 0 {name=p1 sig_type=std_logic lab=en1_p}
C {devices/vsource.sym} -730 200 0 0 {name=Ven3 value=1.2}
C {devices/gnd.sym} -730 250 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -730 160 1 0 {name=p11 sig_type=std_logic lab=en1_n}
C {devices/vsource.sym} -580 200 0 0 {name=Vin2 value="dc 0 ac 1 sin(0.6, 20m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 250 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} -580 160 1 0 {name=p12 sig_type=std_logic lab=V_in1}
C {devices/vsource.sym} -650 20 0 0 {name=Ven4 value=0}
C {devices/gnd.sym} -650 70 0 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} -650 -10 1 0 {name=p13 sig_type=std_logic lab=en2_p}
C {devices/vsource.sym} -730 20 0 0 {name=Ven5 value=1.2}
C {devices/gnd.sym} -730 70 0 0 {name=l13 lab=GND}
C {devices/lab_pin.sym} -730 -10 1 0 {name=p14 sig_type=std_logic lab=en2_n}
C {devices/vsource.sym} -580 20 0 0 {name=Vin3 value="dc=0 ac=1 sin(0.6, 50m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 70 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} -580 -10 1 0 {name=p15 sig_type=std_logic lab=V_in2}
C {devices/vsource.sym} -650 -160 0 0 {name=Ven6 value=0}
C {devices/gnd.sym} -650 -110 0 0 {name=l15 lab=GND}
C {devices/lab_pin.sym} -650 -190 1 0 {name=p16 sig_type=std_logic lab=en3_p}
C {devices/vsource.sym} -730 -160 0 0 {name=Ven7 value=1.2}
C {devices/gnd.sym} -730 -110 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} -730 -190 1 0 {name=p17 sig_type=std_logic lab=en3_n}
C {devices/vsource.sym} -580 -160 0 0 {name=Vin4 value="dc=0 ac=1 sin(0.6, 100m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 -110 0 0 {name=l17 lab=GND}
C {devices/lab_pin.sym} -580 -190 1 0 {name=p18 sig_type=std_logic lab=V_in3}
C {devices/vsource.sym} -650 -340 0 0 {name=Ven8 value=0}
C {devices/gnd.sym} -650 -290 0 0 {name=l18 lab=GND}
C {devices/lab_pin.sym} -650 -370 1 0 {name=p19 sig_type=std_logic lab=en4_p}
C {devices/vsource.sym} -730 -340 0 0 {name=Ven9 value=1.2}
C {devices/gnd.sym} -730 -290 0 0 {name=l19 lab=GND}
C {devices/lab_pin.sym} -730 -370 1 0 {name=p20 sig_type=std_logic lab=en4_n}
C {devices/vsource.sym} -580 -340 0 0 {name=Vin5 value="dc=0 ac=1 sin(0.6, 200m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 -290 0 0 {name=l20 lab=GND}
C {devices/lab_pin.sym} -580 -370 1 0 {name=p21 sig_type=std_logic lab=V_in4}
C {devices/vsource.sym} -650 -520 0 0 {name=Ven10 value=1.2}
C {devices/gnd.sym} -650 -470 0 0 {name=l21 lab=GND}
C {devices/lab_pin.sym} -650 -550 1 0 {name=p22 sig_type=std_logic lab=en5_p}
C {devices/vsource.sym} -730 -520 0 0 {name=Ven11 value=0}
C {devices/gnd.sym} -730 -470 0 0 {name=l22 lab=GND}
C {devices/lab_pin.sym} -730 -550 1 0 {name=p23 sig_type=std_logic lab=en5_n}
C {devices/vsource.sym} -580 -520 0 0 {name=Vin6 value="dc=0 ac=1 sin(0.6, 300m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 -470 0 0 {name=l23 lab=GND}
C {devices/lab_pin.sym} -580 -550 1 0 {name=p24 sig_type=std_logic lab=V_in5}
C {devices/vsource.sym} -650 -700 0 0 {name=Ven12 value=0}
C {devices/gnd.sym} -650 -650 0 0 {name=l24 lab=GND}
C {devices/lab_pin.sym} -650 -730 1 0 {name=p25 sig_type=std_logic lab=en6_p}
C {devices/vsource.sym} -730 -700 0 0 {name=Ven13 value=1.2}
C {devices/gnd.sym} -730 -650 0 0 {name=l25 lab=GND}
C {devices/lab_pin.sym} -730 -730 1 0 {name=p26 sig_type=std_logic lab=en6_n}
C {devices/vsource.sym} -580 -700 0 0 {name=Vin7 value="dc=0 ac=1 sin(0.6, 400m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 -650 0 0 {name=l26 lab=GND}
C {devices/lab_pin.sym} -580 -730 1 0 {name=p27 sig_type=std_logic lab=V_in6}
C {devices/vsource.sym} -650 -880 0 0 {name=Ven14 value=0}
C {devices/gnd.sym} -650 -830 0 0 {name=l27 lab=GND}
C {devices/lab_pin.sym} -650 -910 1 0 {name=p28 sig_type=std_logic lab=en7_p}
C {devices/vsource.sym} -730 -880 0 0 {name=Ven15 value=1.2}
C {devices/gnd.sym} -730 -830 0 0 {name=l28 lab=GND}
C {devices/lab_pin.sym} -730 -910 1 0 {name=p29 sig_type=std_logic lab=en7_n}
C {devices/vsource.sym} -580 -880 0 0 {name=Vin8 value="dc=0 ac=1 sin(0.6, 500m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 -830 0 0 {name=l29 lab=GND}
C {devices/lab_pin.sym} -580 -910 1 0 {name=p30 sig_type=std_logic lab=V_in7}
C {devices/vsource.sym} -650 -1050 0 0 {name=Ven1 value=0}
C {devices/gnd.sym} -650 -1000 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -650 -1080 1 0 {name=p2 sig_type=std_logic lab=en8_p}
C {devices/vsource.sym} -730 -1050 0 0 {name=Ven16 value=1.2}
C {devices/gnd.sym} -730 -1000 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -730 -1080 1 0 {name=p5 sig_type=std_logic lab=en8_n}
C {devices/vsource.sym} -580 -1050 0 0 {name=Vin1 value="dc=0 ac=1 sin(0.6, 600m, 20meg, 0, 0)"}
C {devices/gnd.sym} -580 -1000 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -580 -1080 1 0 {name=p10 sig_type=std_logic lab=V_in8}
C {devices/lab_pin.sym} -150 20 0 0 {name=p31 sig_type=std_logic lab=V_in2}
C {devices/lab_pin.sym} -150 60 0 0 {name=p32 sig_type=std_logic lab=en2_p}
C {devices/lab_pin.sym} -150 40 0 0 {name=p33 sig_type=std_logic lab=en2_n}
C {devices/lab_pin.sym} -150 -40 0 0 {name=p34 sig_type=std_logic lab=V_in3}
C {devices/lab_pin.sym} -150 0 0 0 {name=p35 sig_type=std_logic lab=en3_p}
C {devices/lab_pin.sym} -150 -20 0 0 {name=p36 sig_type=std_logic lab=en3_n}
C {devices/lab_pin.sym} -150 -100 0 0 {name=p37 sig_type=std_logic lab=V_in4}
C {devices/lab_pin.sym} -150 -60 0 0 {name=p38 sig_type=std_logic lab=en4_p}
C {devices/lab_pin.sym} -150 -80 0 0 {name=p39 sig_type=std_logic lab=en4_n}
C {devices/lab_pin.sym} -150 -160 0 0 {name=p40 sig_type=std_logic lab=V_in5}
C {devices/lab_pin.sym} -150 -120 0 0 {name=p41 sig_type=std_logic lab=en5_p}
C {devices/lab_pin.sym} -150 -140 0 0 {name=p42 sig_type=std_logic lab=en5_n}
C {devices/lab_pin.sym} -150 -220 0 0 {name=p43 sig_type=std_logic lab=V_in6}
C {devices/lab_pin.sym} -150 -180 0 0 {name=p44 sig_type=std_logic lab=en6_p}
C {devices/lab_pin.sym} -150 -200 0 0 {name=p45 sig_type=std_logic lab=en6_n}
C {devices/lab_pin.sym} -150 -280 0 0 {name=p46 sig_type=std_logic lab=V_in7}
C {devices/lab_pin.sym} -150 -240 0 0 {name=p47 sig_type=std_logic lab=en7_p}
C {devices/lab_pin.sym} -150 -260 0 0 {name=p48 sig_type=std_logic lab=en7_n}
C {devices/lab_pin.sym} -150 -340 0 0 {name=p49 sig_type=std_logic lab=V_in8}
C {devices/lab_pin.sym} -150 -300 0 0 {name=p50 sig_type=std_logic lab=en8_p}
C {devices/lab_pin.sym} -150 -320 0 0 {name=p51 sig_type=std_logic lab=en8_n}
