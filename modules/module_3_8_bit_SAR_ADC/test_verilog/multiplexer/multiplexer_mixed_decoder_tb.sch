v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 440 -710 1240 -310 {flags=graph

y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=1.1e-16
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
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0
rainbow=0



color="7 6 5 8 10 9 11 12"
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

y2=0.91
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0.29
rainbow=0

color=9
node=v_out
hilight_wave=0}
B 2 440 -1560 1240 -1160 {flags=graph

y2=0
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=-1.3
rainbow=0





hilight_wave=5

color="8 6 4 15 21"
node="ctrl_1
ctrl_2
ctrl_3
ctrl_4
rst"}
B 2 -530 -1780 270 -1380 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.00022
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0
rainbow=0





hilight_wave=5



color=9
node=clk
y2=3.3}
N -150 -780 -150 -760 {
lab=GND}
N 250 -110 250 -90 {
lab=V_out}
N -150 -880 -150 -840 {
lab=Vdd}
N 250 -140 250 -110 {
lab=V_out}
N 0 -380 0 -370 {
lab=#net1}
N 0 -450 0 -440 {
lab=Vdd}
N 0 150 -0 160 {
lab=GND}
N 1380 130 1380 150 {
lab=GND}
N 1380 60 1380 70 {
lab=V_in1}
N 1380 -50 1380 -30 {
lab=GND}
N 1380 -230 1380 -210 {
lab=GND}
N 1380 -410 1380 -390 {
lab=GND}
N 1380 -590 1380 -570 {
lab=GND}
N 1380 -770 1380 -750 {
lab=GND}
N 1380 -950 1380 -930 {
lab=GND}
N 1380 -1120 1380 -1100 {
lab=GND}
N -560 -140 -530 -140 {
lab=#net2}
N -560 -160 -530 -160 {
lab=#net3}
N -560 -180 -530 -180 {
lab=#net4}
N -560 -200 -530 -200 {
lab=#net5}
N 150 -110 250 -110 {
lab=V_out}
N -790 -60 -790 -10 {
lab=clk}
N -630 -60 -630 80 {
lab=rst}
N -790 30 -790 50 {
lab=GND}
N -790 -60 -770 -60 {
lab=clk}
N -790 -120 -790 -60 {
lab=clk}
N -630 -60 -610 -60 {
lab=rst}
N -630 -100 -630 -60 {
lab=rst}
N -550 -120 -530 -120 {
lab=#net6}
N -550 -100 -530 -100 {
lab=#net7}
N -790 -120 -610 -120 {
lab=clk}
N -630 -100 -610 -100 {
lab=rst}
N -740 -200 -620 -200 {
lab=ctrl_1}
N -1200 -180 -1200 -50 {
lab=ctrl_2}
N -810 -180 -620 -180 {
lab=ctrl_2}
N -880 -160 -620 -160 {
lab=ctrl_3}
N -1120 -160 -1120 20 {
lab=ctrl_3}
N -1050 -140 -1050 90 {
lab=ctrl_4}
N -960 -140 -620 -140 {
lab=ctrl_4}
N -740 -230 -740 -200 {
lab=ctrl_1}
N -1270 -200 -740 -200 {
lab=ctrl_1}
N -810 -230 -810 -180 {
lab=ctrl_2}
N -1200 -180 -810 -180 {
lab=ctrl_2}
N -880 -230 -880 -160 {
lab=ctrl_3}
N -1120 -160 -880 -160 {
lab=ctrl_3}
N -960 -230 -960 -140 {
lab=ctrl_4}
N -1050 -140 -960 -140 {
lab=ctrl_4}
N -1270 -200 -1270 -170 {
lab=ctrl_1}
N -1120 80 -1120 100 {
lab=GND}
N -1050 150 -1050 170 {
lab=GND}
N -1200 10 -1200 20 {
lab=GND}
C {devices/code_shown.sym} -440 -1050 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} 130 -1090 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 100n 220u
write tran_decoder.raw
.endc
"}
C {devices/vsource.sym} -150 -810 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -920 290 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 530 190 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tran_decoder.raw tran"
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
C {devices/vsource.sym} 1380 100 0 0 {name=Vin2 value="dc 0 ac 1 sin(0.6, 20m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 150 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 1380 60 1 0 {name=p12 sig_type=std_logic lab=V_in1}
C {devices/vsource.sym} 1380 -80 0 0 {name=Vin3 value="dc=0 ac=1 sin(0.6, 50m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 -30 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} 1380 -110 1 0 {name=p15 sig_type=std_logic lab=V_in2}
C {devices/vsource.sym} 1380 -260 0 0 {name=Vin4 value="dc=0 ac=1 sin(0.6, 100m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 -210 0 0 {name=l17 lab=GND}
C {devices/lab_pin.sym} 1380 -290 1 0 {name=p18 sig_type=std_logic lab=V_in3}
C {devices/vsource.sym} 1380 -440 0 0 {name=Vin5 value="dc=0 ac=1 sin(0.6, 200m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 -390 0 0 {name=l20 lab=GND}
C {devices/lab_pin.sym} 1380 -470 1 0 {name=p21 sig_type=std_logic lab=V_in4}
C {devices/vsource.sym} 1380 -620 0 0 {name=Vin6 value="dc=0 ac=1 sin(0.6, 300m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 -570 0 0 {name=l23 lab=GND}
C {devices/lab_pin.sym} 1380 -650 1 0 {name=p24 sig_type=std_logic lab=V_in5}
C {devices/vsource.sym} 1380 -800 0 0 {name=Vin7 value="dc=0 ac=1 sin(0.6, 400m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 -750 0 0 {name=l26 lab=GND}
C {devices/lab_pin.sym} 1380 -830 1 0 {name=p27 sig_type=std_logic lab=V_in6}
C {devices/vsource.sym} 1380 -980 0 0 {name=Vin8 value="dc=0 ac=1 sin(0.6, 500m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 -930 0 0 {name=l29 lab=GND}
C {devices/lab_pin.sym} 1380 -1010 1 0 {name=p30 sig_type=std_logic lab=V_in7}
C {devices/vsource.sym} 1380 -1150 0 0 {name=Vin1 value="dc=0 ac=1 sin(0.6, 600m, 200k, 0, 0)"}
C {devices/gnd.sym} 1380 -1100 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 1380 -1180 1 0 {name=p10 sig_type=std_logic lab=V_in8}
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
C {devices/lab_pin.sym} -370 -310 2 0 {name=p1 sig_type=std_logic lab=en1_p}
C {devices/lab_pin.sym} -370 -150 2 0 {name=p2 sig_type=std_logic lab=en1_n}
C {devices/lab_pin.sym} -370 -290 2 0 {name=p5 sig_type=std_logic lab=en2_p}
C {devices/lab_pin.sym} -370 -130 2 0 {name=p11 sig_type=std_logic lab=en2_n}
C {devices/lab_pin.sym} -370 -270 2 0 {name=p13 sig_type=std_logic lab=en3_p}
C {devices/lab_pin.sym} -370 -110 2 0 {name=p14 sig_type=std_logic lab=en3_n}
C {devices/lab_pin.sym} -370 -250 2 0 {name=p16 sig_type=std_logic lab=en4_p}
C {devices/lab_pin.sym} -370 -90 2 0 {name=p17 sig_type=std_logic lab=en4_n}
C {devices/lab_pin.sym} -370 -230 2 0 {name=p19 sig_type=std_logic lab=en5_p}
C {devices/lab_pin.sym} -370 -70 2 0 {name=p20 sig_type=std_logic lab=en5_n}
C {devices/lab_pin.sym} -370 -210 2 0 {name=p22 sig_type=std_logic lab=en6_p}
C {devices/lab_pin.sym} -370 -50 2 0 {name=p23 sig_type=std_logic lab=en6_n}
C {devices/lab_pin.sym} -370 -190 2 0 {name=p25 sig_type=std_logic lab=en7_p}
C {devices/lab_pin.sym} -370 -30 2 0 {name=p26 sig_type=std_logic lab=en7_n}
C {devices/lab_pin.sym} -370 -170 2 0 {name=p28 sig_type=std_logic lab=en8_p}
C {devices/lab_pin.sym} -370 -10 2 0 {name=p29 sig_type=std_logic lab=en8_n}
C {adc_bridge1.sym} -590 -200 0 0 {name=A17
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} -590 -180 0 0 {name=A18
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} -590 -160 0 0 {name=A19
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} -590 -140 0 0 {name=A20
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {devices/gnd.sym} -1270 -110 0 0 {name=Vctrl2 lab=GND}
C {devices/lab_pin.sym} -740 -230 1 0 {name=Vctrl3 sig_type=std_logic lab=ctrl_1}
C {devices/gnd.sym} -1050 170 0 0 {name=Vctrl5 lab=GND}
C {devices/lab_pin.sym} -810 -230 1 0 {name=Vctrl6 sig_type=std_logic lab=ctrl_2}
C {devices/gnd.sym} -1120 100 0 0 {name=Vctrl8 lab=GND}
C {devices/lab_pin.sym} -880 -230 1 0 {name=Vctrl9 sig_type=std_logic lab=ctrl_3}
C {devices/gnd.sym} -1200 20 0 0 {name=Vctrl11 lab=GND}
C {devices/lab_pin.sym} -960 -230 1 0 {name=Vctrl12 sig_type=std_logic lab=ctrl_4}
C {devices/gnd.sym} -790 50 0 0 {name=l8 lab=GND
value="dc 0 ac 0 pulse(0 1.2 2u 10n 10n 1u 20u 1)"}
C {decoder.sym} -480 -170 0 0 {name=adut
dut=dut
d_cosim_model=d_cosim
model=./decoder.so
}
C {devices/vsource.sym} -630 110 0 0 {name=Vrst value="dc 0 ac 0 pulse(0 1.2 0 10n 10n 20u 200u 1)"}
C {devices/gnd.sym} -630 140 0 0 {name=l3 lab=GND
value="dc 0 ac 0 pulse(0 1.2 2u 10n 10n 1u 20u 1)"}
C {d_osc.sym} -790 10 0 0 {name=aclock1
clk=clk
d_osc_model=d_osc
freq=200k
}
C {devices/lab_pin.sym} -770 -60 2 0 {name=Vctrl17 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -610 -60 2 0 {name=Vctrl18 sig_type=std_logic lab=rst}
C {adc_bridge1.sym} -580 -100 0 0 {name=A21
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {adc_bridge1.sym} -580 -120 0 0 {name=A22
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.2 
in_high=1.0
}
C {dac_bridge1.sym} -400 -310 0 0 {name=A1
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -290 0 0 {name=A2
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -270 0 0 {name=A3
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -250 0 0 {name=A4
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -230 0 0 {name=A5
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -210 0 0 {name=A6
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -190 0 0 {name=A7
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -170 0 0 {name=A8
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -150 0 0 {name=A9
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -130 0 0 {name=A10
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -110 0 0 {name=A11
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -90 0 0 {name=A12
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -70 0 0 {name=A13
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -50 0 0 {name=A14
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -30 0 0 {name=A15
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {dac_bridge1.sym} -400 -10 0 0 {name=A16
dac=dac1
dac_bridge_model=dac_bridge
out_low=0.0 
out_high=1.2
}
C {devices/vsource.sym} -1270 -140 0 0 {name=Vrst1 value="dc 0 ac 0 pulse(0 0 40u 10n 10n 150u 200u 1)"}
C {devices/vsource.sym} -1200 -20 0 0 {name=Vrst2 value="dc 0 ac 0 pulse(0 1.2 60u 10n 10n 150u 200u 1)"}
C {devices/vsource.sym} -1120 50 0 0 {name=Vrst3 value="dc 0 ac 0 pulse(0 1.2 80u 10n 10n 150u 200u 1)"}
C {devices/vsource.sym} -1050 120 0 0 {name=Vrst4 value="dc 0 ac 0 pulse(0 1.2 100u 10n 10n 150u 200u 1)"}
