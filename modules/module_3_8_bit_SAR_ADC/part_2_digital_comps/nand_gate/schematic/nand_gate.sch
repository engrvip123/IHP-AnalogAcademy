v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 280 -100 340 -100 {lab=gnd}
N 280 -190 340 -190 {lab=gnd}
N 280 -160 280 -130 {lab=#net1}
N 280 -230 280 -220 {lab=Vo}
N 280 -250 400 -250 {lab=Vo}
N 160 -250 280 -250 {lab=Vo}
N 160 -290 160 -250 {lab=Vo}
N 400 -290 400 -250 {lab=Vo}
N 160 -400 160 -350 {lab=vdd}
N 280 -400 400 -400 {lab=vdd}
N 400 -400 400 -350 {lab=vdd}
N 400 -320 460 -320 {lab=vdd}
N 160 -320 220 -320 {lab=vdd}
N 90 -320 120 -320 {lab=A}
N 330 -320 360 -320 {lab=B}
N 210 -190 240 -190 {lab=A}
N 210 -100 240 -100 {lab=B}
N 280 -70 280 -40 {lab=gnd}
N 280 -430 280 -400 {lab=vdd}
N 160 -400 280 -400 {lab=vdd}
N 280 -230 470 -230 {lab=Vo}
N 280 -250 280 -230 {lab=Vo}
C {sg13g2_pr/sg13_lv_pmos.sym} 140 -320 0 0 {name=M5
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 260 -190 0 0 {name=M6
l=0.13u
w=0.25u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 260 -100 0 0 {name=M1
l=0.13u
w=0.25u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 380 -320 0 0 {name=M2
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 90 -320 0 0 {name=p1 sig_type=std_logic lab=A}
C {lab_pin.sym} 330 -320 0 0 {name=p2 sig_type=std_logic lab=B}
C {lab_pin.sym} 280 -430 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 210 -100 0 0 {name=p5 sig_type=std_logic lab=B}
C {lab_pin.sym} 210 -190 0 0 {name=p6 sig_type=std_logic lab=A}
C {lab_pin.sym} 340 -190 0 1 {name=p7 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 340 -100 0 1 {name=p8 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 280 -40 0 1 {name=p4 sig_type=std_logic lab=gnd}
C {iopin.sym} 280 -450 0 0 {name=p9 lab=vdd}
C {iopin.sym} 280 -10 0 0 {name=p10 lab=gnd}
C {lab_pin.sym} 220 -320 0 1 {name=p13 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 460 -320 0 1 {name=p14 sig_type=std_logic lab=vdd}
C {ipin.sym} 110 -170 0 0 {name=p15 lab=A}
C {opin.sym} 470 -230 0 0 {name=p16 lab=Vo}
C {ipin.sym} 110 -200 0 0 {name=p17 lab=B}
