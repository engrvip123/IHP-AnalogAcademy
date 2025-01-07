v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 450 -495 450 -395 {
lab=dn3}
N 450 -575 450 -555 {
lab=dn2}
N 660 -575 660 -555 {
lab=dn2}
N 560 -575 660 -575 {
lab=dn2}
N 380 -525 410 -525 {
lab=v-}
N 700 -525 730 -525 {
lab=v+}
N 560 -595 560 -575 {
lab=dn2}
N 450 -575 560 -575 {
lab=dn2}
N 660 -495 660 -400 {
lab=dn4}
N 230 -315 230 -285 {
lab=vdd}
N 270 -255 270 -235 {
lab=dn4}
N 35 -315 35 -285 {
lab=vdd}
N 75 -255 75 -235 {
lab=dn3}
N 230 -315 270 -315 {
lab=vdd}
N 35 -315 75 -315 {
lab=vdd}
N 230 -425 230 -395 {
lab=vdd}
N 270 -365 270 -345 {
lab=dn2}
N 35 -425 35 -395 {
lab=vdd}
N 75 -365 75 -345 {
lab=dn2}
N 230 -425 270 -425 {
lab=vdd}
N 35 -425 75 -425 {
lab=vdd}
N 560 -245 560 -205 {
lab=vdd}
N 75 -285 180 -285 {
lab=bulk}
N 75 -395 180 -395 {
lab=bulk}
N 450 -525 660 -525 {
lab=bulk}
N 270 -395 375 -395 {
lab=bulk}
N 270 -285 375 -285 {
lab=bulk}
N 560 -325 560 -300 {
lab=bulk}
C {sg13g2_pr/sg13_lv_pmos.sym} 430 -525 0 0 {name=M1
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 680 -525 0 1 {name=M2
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 380 -525 0 1 {name=p10 lab=v-}
C {iopin.sym} 730 -525 0 0 {name=p11 lab=v+}
C {iopin.sym} 675 -205 2 1 {name=p1 lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 250 -285 0 0 {name=M8
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 230 -315 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 55 -285 0 0 {name=M10
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 35 -315 0 0 {name=p17 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 560 -585 0 1 {name=p40 sig_type=std_logic lab=dn2}
C {lab_pin.sym} 75 -235 0 0 {name=p43 sig_type=std_logic lab=dn3}
C {lab_pin.sym} 270 -235 0 0 {name=p18 sig_type=std_logic lab=dn4}
C {sg13g2_pr/sg13_lv_pmos.sym} 250 -395 0 0 {name=M15
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 230 -425 0 0 {name=p49 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 55 -395 0 0 {name=M16
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 35 -425 0 0 {name=p50 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 75 -345 0 0 {name=p53 sig_type=std_logic lab=dn2}
C {lab_pin.sym} 270 -345 0 0 {name=p54 sig_type=std_logic lab=dn2}
C {sg13g2_pr/ntap1.sym} 560 -270 0 0 {name=R1
model=ntap1
spiceprefix=X
w=13e-6
l=34e-6
}
C {iopin.sym} 450 -395 2 1 {name=p3 lab=dn3}
C {iopin.sym} 660 -405 2 1 {name=p4 lab=dn4}
C {lab_pin.sym} 560 -205 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 375 -395 0 1 {name=p2 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 180 -395 0 1 {name=p5 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 180 -285 0 1 {name=p6 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 375 -285 0 1 {name=p7 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 560 -325 0 1 {name=p8 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 560 -525 1 1 {name=p9 sig_type=std_logic lab=bulk}
