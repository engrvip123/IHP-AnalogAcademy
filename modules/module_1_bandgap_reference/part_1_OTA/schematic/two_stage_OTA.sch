v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 -280 440 -240 {
lab=#net1}
N 440 -280 550 -280 {
lab=#net1}
N 440 -150 650 -150 {
lab=vss}
N 440 -210 440 -150 {
lab=vss}
N 550 -210 610 -210 {
lab=#net1}
N 550 -280 550 -210 {
lab=#net1}
N 480 -210 550 -210 {
lab=#net1}
N 650 -210 650 -150 {
lab=vss}
N 440 -340 440 -280 {
lab=#net1}
N 440 -370 650 -370 {
lab=vdd}
N 440 -420 440 -400 {
lab=#net2}
N 650 -420 650 -400 {
lab=#net2}
N 550 -420 650 -420 {
lab=#net2}
N 370 -370 400 -370 {
lab=v-}
N 690 -370 720 -370 {
lab=v+}
N 380 -470 510 -470 {
lab=iout}
N 160 -420 160 -400 {
lab=iout}
N 160 -420 210 -420 {
lab=iout}
N 210 -470 230 -470 {
lab=iout}
N 160 -520 160 -470 {
lab=vdd}
N 160 -440 160 -420 {
lab=iout}
N 210 -470 210 -420 {
lab=iout}
N 200 -470 210 -470 {
lab=iout}
N 790 -470 810 -470 {
lab=iout}
N 850 -520 850 -470 {
lab=vdd}
N 850 -370 890 -370 {
lab=vout}
N 850 -440 850 -370 {
lab=vout}
N 650 -245 650 -240 {
lab=#net3}
N 650 -150 850 -150 {
lab=vss}
N 550 -520 850 -520 {
lab=vdd}
N 160 -520 550 -520 {
lab=vdd}
N 550 -520 550 -470 {
lab=vdd}
N 550 -440 550 -420 {
lab=#net2}
N 440 -420 550 -420 {
lab=#net2}
N 850 -245 850 -150 {
lab=vss}
N 750 -245 810 -245 {
lab=#net3}
N 650 -340 650 -245 {
lab=#net3}
N 750 -305 750 -245 {
lab=#net3}
N 650 -245 750 -245 {
lab=#net3}
N 850 -305 850 -275 {
lab=vout}
N 810 -305 850 -305 {
lab=vout}
N 850 -370 850 -305 {
lab=vout}
C {sg13g2_pr/sg13_lv_nmos.sym} 630 -210 2 1 {name=M4
l=9.75u
w=720n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 460 -210 2 0 {name=M3
l=9.75u
w=720n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 420 -370 0 0 {name=M1
l=3.64u
w=3.705u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 670 -370 0 1 {name=M2
l=3.64u
w=3.705u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 530 -470 0 0 {name=M5
l=1.95u
w=5.3u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 830 -470 0 0 {name=M7
l=2.08u
w=75u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 830 -245 2 1 {name=M6
l=9.75u
w=28.8u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 370 -370 0 1 {name=p10 lab=v-}
C {iopin.sym} 720 -370 0 0 {name=p11 lab=v+}
C {iopin.sym} 550 -150 1 1 {name=p5 lab=vss}
C {iopin.sym} 550 -520 1 1 {name=p1 lab=vdd}
C {iopin.sym} 160 -400 0 1 {name=p3 lab=iout}
C {iopin.sym} 890 -370 0 0 {name=p8 lab=vout}
C {lab_pin.sym} 230 -470 0 1 {name=p7 sig_type=std_logic lab=iout}
C {lab_pin.sym} 790 -470 0 0 {name=p6 sig_type=std_logic lab=iout}
C {lab_pin.sym} 550 -370 3 0 {name=p2 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 180 -470 0 1 {name=M9
l=2.08u
w=75u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/cap_cmim.sym} 780 -305 3 0 {name=C2
model=cap_cmim
w=22.295e-6
l=22.295e-6
m=1
spiceprefix=X}
C {lab_pin.sym} 380 -470 0 0 {name=p4 sig_type=std_logic lab=iout}
