v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 450 -495 450 -395 {
lab=dn3}
N 450 -525 660 -525 {
lab=well}
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
N 230 -285 285 -285 {
lab=well}
N 190 -315 190 -285 {
lab=vdd}
N 230 -255 230 -235 {
lab=dn4}
N 75 -285 130 -285 {
lab=well}
N 35 -315 35 -285 {
lab=vdd}
N 75 -255 75 -235 {
lab=dn3}
N 190 -315 230 -315 {
lab=vdd}
N 35 -315 75 -315 {
lab=vdd}
N 560 -445 560 -415 {
lab=well}
N 560 -355 560 -315 {
lab=#net1}
N 230 -395 285 -395 {
lab=well}
N 190 -425 190 -395 {
lab=vdd}
N 230 -365 230 -345 {
lab=dn2}
N 75 -395 130 -395 {
lab=well}
N 35 -425 35 -395 {
lab=vdd}
N 75 -365 75 -345 {
lab=dn2}
N 190 -425 230 -425 {
lab=vdd}
N 35 -425 75 -425 {
lab=vdd}
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
C {iopin.sym} 560 -315 2 1 {name=p1 lab=vdd}
C {lab_pin.sym} 450 -455 0 0 {name=p9 sig_type=std_logic lab=dn3}
C {lab_pin.sym} 660 -455 0 0 {name=p12 sig_type=std_logic lab=dn4}
C {sg13g2_pr/sg13_lv_pmos.sym} 210 -285 0 0 {name=M8
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 190 -315 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 55 -285 0 0 {name=M10
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 35 -315 0 0 {name=p17 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 560 -445 0 0 {name=p30 sig_type=std_logic lab=well}
C {sg13g2_pr/ntap1.sym} 560 -385 2 0 {name=R3
model=ntap1
spiceprefix=X
R=262.847.0
Imax=0.3e-6
}
C {lab_pin.sym} 560 -525 3 0 {name=p2 sig_type=std_logic lab=well}
C {lab_pin.sym} 130 -285 0 1 {name=p32 sig_type=std_logic lab=well}
C {lab_pin.sym} 285 -285 0 1 {name=p33 sig_type=std_logic lab=well}
C {lab_pin.sym} 560 -585 0 1 {name=p40 sig_type=std_logic lab=dn2}
C {lab_pin.sym} 75 -235 0 0 {name=p43 sig_type=std_logic lab=dn3}
C {lab_pin.sym} 230 -235 0 0 {name=p18 sig_type=std_logic lab=dn4}
C {sg13g2_pr/sg13_lv_pmos.sym} 210 -395 0 0 {name=M15
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 190 -425 0 0 {name=p49 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 55 -395 0 0 {name=M16
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 35 -425 0 0 {name=p50 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 130 -395 0 1 {name=p51 sig_type=std_logic lab=well}
C {lab_pin.sym} 285 -395 0 1 {name=p52 sig_type=std_logic lab=well}
C {lab_pin.sym} 75 -345 0 0 {name=p53 sig_type=std_logic lab=dn2}
C {lab_pin.sym} 230 -345 0 0 {name=p54 sig_type=std_logic lab=dn2}
