v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1610 -240 1810 -240 {lab=vo}
N 1020 -240 1020 -230 {lab=vo}
N 1220 -240 1220 -230 {lab=vo}
N 1420 -240 1420 -230 {lab=vo}
N 1220 -240 1420 -240 {lab=vo}
N 1610 -240 1610 -230 {lab=vo}
N 1420 -240 1610 -240 {lab=vo}
N 1810 -240 1810 -230 {lab=vo}
N 820 -240 820 -230 {lab=vo}
N 1020 -240 1220 -240 {lab=vo}
N 820 -240 1020 -240 {lab=vo}
N 620 -240 820 -240 {lab=vo}
N 620 -240 620 -230 {lab=vo}
N 420 -240 420 -230 {lab=vo}
N 420 -240 620 -240 {lab=vo}
N 1020 -170 1020 -130 {lab=C4}
N 1220 -170 1220 -130 {lab=C3}
N 1420 -170 1420 -130 {lab=C2}
N 1610 -170 1610 -130 {lab=C1}
N 1810 -170 1810 -130 {lab=vref}
N 170 -240 420 -240 {lab=vo}
N 1810 -240 1850 -240 {lab=vo}
N 420 -170 420 -130 {lab=#net2}
N 620 -170 620 -130 {lab=C6}
N 820 -170 820 -130 {lab=C5}
N 90 -240 110 -240 {lab=vin}
C {sg13g2_pr/cap_cmim.sym} 1810 -200 0 0 {name=C1
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 1610 -200 0 0 {name=C2
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 1420 -200 0 0 {name=C3
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=2
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 1220 -200 0 0 {name=C4
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=4
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 1020 -200 0 0 {name=C5
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=8
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 820 -200 0 0 {name=C6
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=16
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 620 -200 0 0 {name=C7
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=32
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 420 -200 0 0 {name=C8
model=cap_cmim
w=5.71e-6
l=5.71e-6
m=64
spiceprefix=X}
C {iopin.sym} 90 -240 0 1 {name=p1 lab=vin}
C {iopin.sym} 1850 -240 0 0 {name=p2 lab=vo}
C {iopin.sym} 620 -130 0 1 {name=p4 lab=C6}
C {iopin.sym} 820 -130 0 1 {name=p5 lab=C5}
C {iopin.sym} 1020 -130 0 1 {name=p6 lab=C4}
C {iopin.sym} 1220 -130 0 1 {name=p7 lab=C3}
C {iopin.sym} 1420 -130 0 1 {name=p8 lab=C2}
C {iopin.sym} 1610 -130 0 1 {name=p9 lab=C1}
C {iopin.sym} 1810 -130 0 1 {name=p10 lab=vref}
C {res.sym} 140 -240 3 0 {name=R1
value=1
footprint=1206
device=resistor
m=1}
C {iopin.sym} 420 -130 0 1 {name=p12 lab=C_MSB}
