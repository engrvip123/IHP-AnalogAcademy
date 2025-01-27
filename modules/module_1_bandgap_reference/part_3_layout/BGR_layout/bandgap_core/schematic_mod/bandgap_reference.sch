v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 370 -560 390 -560 {
lab=#net1}
N 370 -620 370 -560 {
lab=#net1}
N 370 -620 430 -620 {
lab=#net1}
N 130 -560 130 -460 {
lab=GND}
N 280 -460 430 -460 {
lab=GND}
N 130 -740 230 -740 {
lab=v-}
N 280 -965 280 -940 {
lab=vdd}
N 130 -940 280 -940 {
lab=vdd}
N 130 -840 130 -740 {
lab=v-}
N 430 -750 430 -740 {
lab=v+}
N 430 -740 430 -710 {
lab=v+}
N 430 -560 430 -460 {
lab=GND}
N 430 -620 430 -590 {
lab=#net1}
N 430 -650 430 -620 {
lab=#net1}
N 280 -460 280 -430 {
lab=GND}
N 130 -460 280 -460 {
lab=GND}
N 170 -870 390 -870 {
lab=Vo1}
N 595 -900 595 -870 {
lab=Vo1}
N 430 -750 595 -750 {
lab=v+}
N 980 -770 1030 -770 {
lab=VBG}
N 635 -840 635 -770 {
lab=VBG}
N 315 -740 430 -740 {
lab=v+}
N 430 -840 430 -750 {
lab=v+}
N 595 -750 595 -710 {
lab=v+}
N 430 -460 595 -460 {
lab=GND}
N 595 -650 595 -460 {
lab=GND}
N 430 -940 635 -940 {
lab=vdd}
N 980 -655 980 -460 {
lab=GND}
N 800 -460 980 -460 {
lab=GND}
N 980 -770 980 -715 {
lab=VBG}
N 800 -770 980 -770 {
lab=VBG}
N 635 -940 635 -900 {
lab=vdd}
N 635 -870 725 -870 {
lab=vdd}
N 430 -940 430 -900 {
lab=vdd}
N 280 -940 430 -940 {
lab=vdd}
N 430 -870 495 -870 {
lab=vdd}
N 130 -940 130 -900 {
lab=vdd}
N 70 -870 130 -870 {
lab=vdd}
N 130 -740 130 -590 {
lab=v-}
N 170 -560 315 -560 {
lab=v+}
N 315 -740 315 -560 {
lab=v+}
N 800 -770 800 -715 {
lab=VBG}
N 635 -770 800 -770 {
lab=VBG}
N 800 -655 800 -460 {
lab=GND}
N 595 -460 800 -460 {
lab=GND}
N 1195 -730 1195 -700 {
lab=bulk7}
N 1195 -640 1195 -600 {
lab=vdd}
N 1290 -640 1290 -605 {
lab=vss}
N 1290 -725 1290 -700 {
lab=sub!}
C {sg13g2_pr/sg13_lv_nmos.sym} 150 -560 2 0 {name=M1
l=5u
w=7.14u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 410 -560 2 1 {name=M2
l=5u
w=21u
ng=8
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 280 -430 0 0 {name=l3 lab=GND}
C {sg13g2_pr/sg13_lv_pmos.sym} 150 -870 0 1 {name=M3
l=5u
w=15u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 410 -870 0 0 {name=M4
l=5u
w=15u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 280 -965 0 1 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 230 -740 3 0 {name=p3 sig_type=std_logic lab=v-}
C {lab_pin.sym} 315 -740 0 0 {name=p8 sig_type=std_logic lab=v+}
C {lab_pin.sym} 285 -870 1 1 {name=p9 sig_type=std_logic lab=Vo1}
C {sg13g2_pr/sg13_lv_pmos.sym} 615 -870 0 0 {name=M5
l=5u
w=16u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {opin.sym} 1030 -770 0 0 {name=p11 lab=VBG}
C {lab_pin.sym} 595 -900 2 1 {name=p12 sig_type=std_logic lab=Vo1}
C {lab_pin.sym} 70 -870 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 495 -870 0 1 {name=p14 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 725 -870 0 1 {name=p15 sig_type=std_logic lab=vdd}
C {sg13g2_pr/cap_cmim.sym} 980 -685 0 0 {name=C3
model=cap_cmim
w=72.965e-6
l=72.965e-6
m=1
spiceprefix=X}
C {sg13g2_pr/rppd.sym} 430 -680 0 0 {name=R3
w=0.5e-6
l=194.345e-6
model=rppd
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 595 -680 0 0 {name=R1
w=0.6e-6
l=194.345e-6
model=rppd
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 800 -685 0 0 {name=R2
w=0.5e-6
l=192.395e-6
model=rppd
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 1195 -730 0 1 {name=p67 sig_type=std_logic lab=bulk7}
C {lab_pin.sym} 1195 -600 0 0 {name=p68 sig_type=std_logic lab=vdd}
C {sg13g2_pr/ntap1.sym} 1195 -670 0 0 {name=R27
model=ntap1
spiceprefix=X
R=8.463
Imax=0.3e-6
}
C {sg13g2_pr/ptap1.sym} 1290 -670 0 0 {name=R29
model=ptap1
spiceprefix=X
w=10e-6
l=1.0e-6
}
C {lab_pin.sym} 1290 -605 0 0 {name=p81 sig_type=std_logic lab=vss}
C {lab_pin.sym} 1290 -725 0 1 {name=p82 sig_type=std_logic lab=sub!}
