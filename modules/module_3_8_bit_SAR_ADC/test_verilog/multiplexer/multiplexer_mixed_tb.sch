v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 440 -710 1240 -310 {flags=graph

y2=1.56
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.6940659e-21
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0.26
rainbow=0

color="4 5 6 7 8 9 10 12"
node="v_in1
v_in2
v_in3
v_in4
v_in5
v_in6
v_in7
v_in8"}
B 2 440 -1140 1240 -740 {flags=graph

y2=2.86
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.6940659e-21
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=1.56
rainbow=0



color="7 12 4 8 4 4 4 9"
node="en1_p
en2_p
en3_p
en4_p
en5_p
en6_p
en7_p
en8_p"
hilight_wave=1}
B 2 440 -290 1240 110 {flags=graph

y2=0.94
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.6940659e-21
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0.0004
rainbow=0

color=9
node=v_out}
B 2 440 -1560 1240 -1160 {flags=graph

y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.6940659e-21
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0
rainbow=0





hilight_wave=1
color="4 9"
node="mosi
sck"}
T {
} -210 -250 0 0 0.4 0.4 {}
N 0 -1070 0 -1050 {
lab=GND}
N 370 -710 370 -690 {
lab=V_out}
N 0 -1170 0 -1130 {
lab=Vdd}
N 370 -740 370 -710 {
lab=V_out}
N 120 -980 120 -970 {
lab=#net1}
N 120 -1050 120 -1040 {
lab=Vdd}
N 120 -450 120 -440 {
lab=GND}
N -740 120 -740 140 {
lab=GND}
N -740 50 -740 60 {
lab=V_in1}
N -740 -60 -740 -40 {
lab=GND}
N -740 -240 -740 -220 {
lab=GND}
N -740 -420 -740 -400 {
lab=GND}
N -740 -600 -740 -580 {
lab=GND}
N -740 -780 -740 -760 {
lab=GND}
N -740 -960 -740 -940 {
lab=GND}
N -740 -1130 -740 -1110 {
lab=GND}
N 50 -150 80 -150 {
lab=#net2}
N 50 -170 80 -170 {
lab=#net3}
N 50 -190 80 -190 {
lab=#net4}
N 50 -210 80 -210 {
lab=#net5}
N 50 -230 80 -230 {
lab=#net6}
N 240 -350 340 -350 {
lab=#net7}
N 340 -350 340 -330 {
lab=#net7}
N -490 -230 -490 -210 {
lab=clk}
N -490 -170 -490 -150 {
lab=GND}
N -410 -210 -410 -120 {
lab=rst}
N -280 -230 -10 -230 {
lab=clk}
N -220 -210 -10 -210 {
lab=rst}
N -350 -190 -350 -50 {
lab=sck}
N -290 -170 -290 20 {
lab=mosi}
N -40 -150 -10 -150 {
lab=ss}
N -230 -150 -230 90 {
lab=ss}
N -160 -190 -10 -190 {
lab=sck}
N -100 -170 -10 -170 {
lab=mosi}
N -280 -300 -280 -230 {
lab=clk}
N -490 -230 -280 -230 {
lab=clk}
N -220 -300 -220 -210 {
lab=rst}
N -410 -210 -220 -210 {
lab=rst}
N -160 -300 -160 -190 {
lab=sck}
N -350 -190 -160 -190 {
lab=sck}
N -100 -300 -100 -170 {
lab=mosi}
N -290 -170 -100 -170 {
lab=mosi}
N -40 -300 -40 -150 {
lab=ss}
N -230 -150 -40 -150 {
lab=ss}
N 310 -710 370 -710 {
lab=V_out}
N 310 -710 310 -690 {
lab=V_out}
N 270 -710 310 -710 {
lab=V_out}
C {devices/code_shown.sym} -430 -1220 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} -440 -1100 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
ic V(V_out)=0.6
tran 100n 220u
write tran_res_temp.raw
.endc
"}
C {devices/vsource.sym} 0 -1100 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 510 150 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tran_res_temp.raw tran"
}
C {devices/gnd.sym} 120 -440 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 120 -1010 0 0 {name=Vp}
C {devices/gnd.sym} 0 -1050 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 370 -740 1 0 {name=p3 sig_type=std_logic lab=V_out}
C {devices/capa.sym} 370 -660 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 370 -630 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 0 -1170 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} 120 -1050 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -30 -520 0 0 {name=p7 sig_type=std_logic lab=V_in1}
C {devices/lab_pin.sym} -30 -480 0 0 {name=p8 sig_type=std_logic lab=en1_p}
C {devices/lab_pin.sym} -30 -500 0 0 {name=p9 sig_type=std_logic lab=en1_n}
C {multiplexer.sym} 120 -710 0 0 {name=x1}
C {devices/vsource.sym} -740 90 0 0 {name=Vin2 value="dc 0 ac 1 sin(0.6, 20m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 140 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} -740 50 1 0 {name=p12 sig_type=std_logic lab=V_in1}
C {devices/vsource.sym} -740 -90 0 0 {name=Vin3 value="dc=0 ac=1 sin(0.6, 50m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 -40 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} -740 -120 1 0 {name=p15 sig_type=std_logic lab=V_in2}
C {devices/vsource.sym} -740 -270 0 0 {name=Vin4 value="dc=0 ac=1 sin(0.6, 100m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 -220 0 0 {name=l17 lab=GND}
C {devices/lab_pin.sym} -740 -300 1 0 {name=p18 sig_type=std_logic lab=V_in3}
C {devices/vsource.sym} -740 -450 0 0 {name=Vin5 value="dc=0 ac=1 sin(0.6, 200m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 -400 0 0 {name=l20 lab=GND}
C {devices/lab_pin.sym} -740 -480 1 0 {name=p21 sig_type=std_logic lab=V_in4}
C {devices/vsource.sym} -740 -630 0 0 {name=Vin6 value="dc=0 ac=1 sin(0.6, 300m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 -580 0 0 {name=l23 lab=GND}
C {devices/lab_pin.sym} -740 -660 1 0 {name=p24 sig_type=std_logic lab=V_in5}
C {devices/vsource.sym} -740 -810 0 0 {name=Vin7 value="dc=0 ac=1 sin(0.6, 400m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 -760 0 0 {name=l26 lab=GND}
C {devices/lab_pin.sym} -740 -840 1 0 {name=p27 sig_type=std_logic lab=V_in6}
C {devices/vsource.sym} -740 -990 0 0 {name=Vin8 value="dc=0 ac=1 sin(0.6, 500m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 -940 0 0 {name=l29 lab=GND}
C {devices/lab_pin.sym} -740 -1020 1 0 {name=p30 sig_type=std_logic lab=V_in7}
C {devices/vsource.sym} -740 -1160 0 0 {name=Vin1 value="dc=0 ac=1 sin(0.6, 600m, 200k, 0, 0)"}
C {devices/gnd.sym} -740 -1110 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -740 -1190 1 0 {name=p10 sig_type=std_logic lab=V_in8}
C {devices/lab_pin.sym} -30 -580 0 0 {name=p31 sig_type=std_logic lab=V_in2}
C {devices/lab_pin.sym} -30 -540 0 0 {name=p32 sig_type=std_logic lab=en2_p}
C {devices/lab_pin.sym} -30 -560 0 0 {name=p33 sig_type=std_logic lab=en2_n}
C {devices/lab_pin.sym} -30 -640 0 0 {name=p34 sig_type=std_logic lab=V_in3}
C {devices/lab_pin.sym} -30 -600 0 0 {name=p35 sig_type=std_logic lab=en3_p}
C {devices/lab_pin.sym} -30 -620 0 0 {name=p36 sig_type=std_logic lab=en3_n}
C {devices/lab_pin.sym} -30 -700 0 0 {name=p37 sig_type=std_logic lab=V_in4}
C {devices/lab_pin.sym} -30 -660 0 0 {name=p38 sig_type=std_logic lab=en4_p}
C {devices/lab_pin.sym} -30 -680 0 0 {name=p39 sig_type=std_logic lab=en4_n}
C {devices/lab_pin.sym} -30 -760 0 0 {name=p40 sig_type=std_logic lab=V_in5}
C {devices/lab_pin.sym} -30 -720 0 0 {name=p41 sig_type=std_logic lab=en5_p}
C {devices/lab_pin.sym} -30 -740 0 0 {name=p42 sig_type=std_logic lab=en5_n}
C {devices/lab_pin.sym} -30 -820 0 0 {name=p43 sig_type=std_logic lab=V_in6}
C {devices/lab_pin.sym} -30 -780 0 0 {name=p44 sig_type=std_logic lab=en6_p}
C {devices/lab_pin.sym} -30 -800 0 0 {name=p45 sig_type=std_logic lab=en6_n}
C {devices/lab_pin.sym} -30 -880 0 0 {name=p46 sig_type=std_logic lab=V_in7}
C {devices/lab_pin.sym} -30 -840 0 0 {name=p47 sig_type=std_logic lab=en7_p}
C {devices/lab_pin.sym} -30 -860 0 0 {name=p48 sig_type=std_logic lab=en7_n}
C {devices/lab_pin.sym} -30 -940 0 0 {name=p49 sig_type=std_logic lab=V_in8}
C {devices/lab_pin.sym} -30 -900 0 0 {name=p50 sig_type=std_logic lab=en8_p}
C {devices/lab_pin.sym} -30 -920 0 0 {name=p51 sig_type=std_logic lab=en8_n}
C {control.sym} 130 -190 0 0 {name=adut
dut=dut
d_cosim_model= d_cosim
model=./control.so
}
C {devices/lab_pin.sym} 240 -330 2 0 {name=p1 sig_type=std_logic lab=en1_p}
C {devices/lab_pin.sym} 240 -170 2 0 {name=p2 sig_type=std_logic lab=en1_n}
C {devices/lab_pin.sym} 240 -310 2 0 {name=p5 sig_type=std_logic lab=en2_p}
C {devices/lab_pin.sym} 240 -150 2 0 {name=p11 sig_type=std_logic lab=en2_n}
C {devices/lab_pin.sym} 240 -290 2 0 {name=p13 sig_type=std_logic lab=en3_p}
C {devices/lab_pin.sym} 240 -130 2 0 {name=p14 sig_type=std_logic lab=en3_n}
C {devices/lab_pin.sym} 240 -270 2 0 {name=p16 sig_type=std_logic lab=en4_p}
C {devices/lab_pin.sym} 240 -110 2 0 {name=p17 sig_type=std_logic lab=en4_n}
C {devices/lab_pin.sym} 240 -250 2 0 {name=p19 sig_type=std_logic lab=en5_p}
C {devices/lab_pin.sym} 240 -90 2 0 {name=p20 sig_type=std_logic lab=en5_n}
C {devices/lab_pin.sym} 240 -230 2 0 {name=p22 sig_type=std_logic lab=en6_p}
C {devices/lab_pin.sym} 240 -70 2 0 {name=p23 sig_type=std_logic lab=en6_n}
C {devices/lab_pin.sym} 240 -210 2 0 {name=p25 sig_type=std_logic lab=en7_p}
C {devices/lab_pin.sym} 240 -50 2 0 {name=p26 sig_type=std_logic lab=en7_n}
C {devices/lab_pin.sym} 240 -190 2 0 {name=p28 sig_type=std_logic lab=en8_p}
C {devices/lab_pin.sym} 240 -30 2 0 {name=p29 sig_type=std_logic lab=en8_n}
C {adc_bridge1.sym} 20 -230 0 0 {name=A17
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} 20 -210 0 0 {name=A18
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} 20 -190 0 0 {name=A19
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} 20 -170 0 0 {name=A20
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} 20 -150 0 0 {name=A21
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {devices/capa.sym} 340 -300 0 0 {name=C2
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 340 -270 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -410 -90 0 0 {name=Vrst value="dc 0 ac 0 pulse(0 1.2 0 10n 10n 10u 800u)"}
C {d_osc.sym} -490 -190 0 0 {name=aclock1
clk=clk
d_osc_model=d_osc
freq=100k
}
C {devices/vsource.sym} -350 -20 0 0 {name=Vsck value="dc 0 ac 0 pulse(0 1.2 30u 10n 10n 10u 20u 8)"}
C {devices/vsource.sym} -290 50 0 0 {name=Vmosi value="dc 0 ac 0 pulse(0 1.2 62u 10n 10n 20u 80u 1)"}
C {devices/vsource.sym} -230 120 0 0 {name=Vss value="dc 0 ac 0 pulse(1.2 0 20u 10n 10n 170u 200u 1)"}
C {devices/gnd.sym} -490 -150 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} -410 -60 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} -350 10 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} -290 80 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} -230 150 0 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} -280 -300 1 0 {name=p52 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -220 -300 1 0 {name=p53 sig_type=std_logic lab=rst}
C {devices/lab_pin.sym} -160 -300 1 0 {name=p54 sig_type=std_logic lab=sck}
C {devices/lab_pin.sym} -100 -300 1 0 {name=p55 sig_type=std_logic lab=mosi}
C {devices/lab_pin.sym} -40 -300 1 0 {name=p56 sig_type=std_logic lab=ss}
C {dac_bridge1.sym} 210 -350 0 0 {name=A1
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -330 0 0 {name=A2
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -310 0 0 {name=A3
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -290 0 0 {name=A4
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -270 0 0 {name=A5
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -250 0 0 {name=A6
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -230 0 0 {name=A7
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -210 0 0 {name=A8
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -190 0 0 {name=A9
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -170 0 0 {name=A10
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -150 0 0 {name=A11
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -130 0 0 {name=A12
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -110 0 0 {name=A13
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -90 0 0 {name=A14
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -70 0 0 {name=A15
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -50 0 0 {name=A16
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} 210 -30 0 0 {name=A22
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {devices/res.sym} 310 -660 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 310 -630 0 0 {name=l13 lab=GND}
