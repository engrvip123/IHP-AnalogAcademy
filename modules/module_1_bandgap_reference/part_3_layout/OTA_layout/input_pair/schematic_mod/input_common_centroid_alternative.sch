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
lab=bulk}
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
N 660 -335 715 -335 {
lab=bulk}
N 620 -365 620 -335 {
lab=#net1}
N 660 -305 660 -285 {
lab=dn4}
N 425 -345 480 -345 {
lab=bulk}
N 385 -375 385 -345 {
lab=#net2}
N 425 -315 425 -295 {
lab=dn3}
N 620 -365 660 -365 {
lab=#net1}
N 385 -375 425 -375 {
lab=#net2}
N 420 -645 475 -645 {
lab=bulk}
N 380 -675 380 -645 {
lab=#net3}
N 420 -615 420 -595 {
lab=dn2}
N 655 -655 710 -655 {
lab=bulk}
N 615 -685 615 -655 {
lab=#net4}
N 655 -625 655 -605 {
lab=dn2}
N 380 -675 420 -675 {
lab=#net3}
N 615 -685 655 -685 {
lab=#net4}
N 120 -375 120 -340 {
lab=bulk}
N 120 -285 120 -245 {
lab=vdd}
N 1170 -365 1225 -365 {
lab=bulk}
N 1130 -395 1130 -365 {
lab=#net5}
N 1170 -335 1170 -315 {
lab=dn4}
N 885 -355 940 -355 {
lab=bulk}
N 845 -385 845 -355 {
lab=#net6}
N 885 -325 885 -305 {
lab=dn3}
N 1130 -395 1170 -395 {
lab=#net5}
N 845 -385 885 -385 {
lab=#net6}
N 1090 -655 1145 -655 {
lab=bulk}
N 1050 -685 1050 -655 {
lab=#net7}
N 1090 -625 1090 -605 {
lab=dn2}
N 925 -645 980 -645 {
lab=bulk}
N 885 -675 885 -645 {
lab=#net8}
N 925 -615 925 -595 {
lab=dn2}
N 1050 -685 1090 -685 {
lab=#net7}
N 885 -675 925 -675 {
lab=#net8}
N 890 -495 890 -395 {
lab=dn3}
N 890 -525 1100 -525 {
lab=bulk}
N 890 -575 890 -555 {
lab=dn2}
N 1100 -575 1100 -555 {
lab=dn2}
N 1000 -575 1100 -575 {
lab=dn2}
N 820 -525 850 -525 {
lab=v-}
N 1140 -525 1170 -525 {
lab=v+}
N 1000 -595 1000 -575 {
lab=dn2}
N 890 -575 1000 -575 {
lab=dn2}
N 1100 -495 1100 -400 {
lab=dn4}
C {sg13g2_pr/sg13_lv_pmos.sym} 430 -525 0 0 {name=M1
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 680 -525 0 1 {name=M2
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 380 -525 0 1 {name=p10 lab=v-
m=1}
C {iopin.sym} 730 -525 0 0 {name=p11 lab=v+
m=1}
C {iopin.sym} 120 -245 2 1 {name=p1 lab=vdd}
C {lab_pin.sym} 450 -455 0 0 {name=p9 sig_type=std_logic lab=dn3
m=1}
C {lab_pin.sym} 660 -455 0 0 {name=p12 sig_type=std_logic lab=dn4
m=1}
C {sg13g2_pr/sg13_lv_pmos.sym} 640 -335 0 0 {name=M8
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 405 -345 0 0 {name=M10
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 120 -375 0 0 {name=p30 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 560 -525 3 0 {name=p2 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 480 -345 0 1 {name=p32 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 715 -335 0 1 {name=p33 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 560 -585 0 1 {name=p40 sig_type=std_logic lab=dn2
m=1}
C {lab_pin.sym} 425 -295 0 0 {name=p43 sig_type=std_logic lab=dn3
m=1}
C {lab_pin.sym} 660 -285 0 0 {name=p18 sig_type=std_logic lab=dn4
m=1}
C {sg13g2_pr/sg13_lv_pmos.sym} 400 -645 0 0 {name=M15
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 635 -655 0 0 {name=M16
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 710 -655 0 1 {name=p51 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 475 -645 0 1 {name=p52 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 655 -605 0 0 {name=p53 sig_type=std_logic lab=dn2
m=1}
C {lab_pin.sym} 420 -595 0 0 {name=p54 sig_type=std_logic lab=dn2
m=1}
C {sg13g2_pr/ntap1.sym} 120 -310 2 0 {name=R1
model=ntap1
spiceprefix=X
w=13e-6
l=34e-6
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1150 -365 0 0 {name=M3
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 865 -355 0 0 {name=M4
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 940 -355 0 1 {name=p5 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 1225 -365 0 1 {name=p6 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 885 -305 0 0 {name=p7 sig_type=std_logic lab=dn3
m=1}
C {lab_pin.sym} 1170 -315 0 0 {name=p8 sig_type=std_logic lab=dn4
m=1}
C {sg13g2_pr/sg13_lv_pmos.sym} 1070 -655 0 0 {name=M5
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 905 -645 0 0 {name=M6
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 980 -645 0 1 {name=p16 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 1145 -655 0 1 {name=p19 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 925 -595 0 0 {name=p20 sig_type=std_logic lab=dn2
m=1}
C {lab_pin.sym} 1090 -605 0 0 {name=p21 sig_type=std_logic lab=dn2
m=1}
C {sg13g2_pr/sg13_lv_pmos.sym} 870 -525 0 0 {name=M7
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1120 -525 0 1 {name=M9
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 820 -525 0 1 {name=p22 lab=v-
m=1}
C {iopin.sym} 1170 -525 0 0 {name=p23 lab=v+
m=1}
C {lab_pin.sym} 890 -455 0 0 {name=p24 sig_type=std_logic lab=dn3
m=1}
C {lab_pin.sym} 1100 -455 0 0 {name=p25 sig_type=std_logic lab=dn4
m=1}
C {lab_pin.sym} 1000 -525 3 0 {name=p26 sig_type=std_logic lab=bulk
m=1}
C {lab_pin.sym} 1000 -585 0 1 {name=p27 sig_type=std_logic lab=dn2
m=1}
C {iopin.sym} 385 -375 2 0 {name=p3 lab=vdd}
C {iopin.sym} 620 -360 2 0 {name=p4 lab=vdd}
C {iopin.sym} 845 -380 2 0 {name=p13 lab=vdd}
C {iopin.sym} 1130 -390 2 0 {name=p14 lab=vdd}
C {iopin.sym} 1050 -675 2 0 {name=p15 lab=vdd}
C {iopin.sym} 885 -665 2 0 {name=p17 lab=vdd}
C {iopin.sym} 615 -680 2 0 {name=p28 lab=vdd}
C {iopin.sym} 380 -675 2 0 {name=p29 lab=vdd}
