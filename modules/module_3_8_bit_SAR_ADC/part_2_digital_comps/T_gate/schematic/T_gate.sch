v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 -270 160 -270 {lab=Vin}
N 80 -180 80 -100 {lab=Vin}
N 80 -100 160 -100 {lab=Vin}
N 220 -270 300 -270 {lab=Vout}
N 300 -180 300 -100 {lab=Vout}
N 220 -100 300 -100 {lab=Vout}
N 300 -180 340 -180 {lab=Vout}
N 300 -270 300 -180 {lab=Vout}
N 40 -180 80 -180 {lab=Vin}
N 80 -270 80 -180 {lab=Vin}
N 190 -140 190 -100 {lab=gnd}
N 190 -270 190 -250 {lab=vdd}
N 190 -350 190 -310 {lab=!Control}
N 190 -60 190 -20 {lab=Control}
C {sg13g2_pr/sg13_lv_nmos.sym} 190 -80 3 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 190 -290 1 0 {name=M2
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 340 -180 0 0 {name=p1 lab=Vout}
C {iopin.sym} 40 -180 0 1 {name=p2 lab=Vin}
C {iopin.sym} 190 -350 0 1 {name=p3 lab=!Control}
C {iopin.sym} 190 -20 0 1 {name=p4 lab=Control}
C {iopin.sym} 190 -140 1 1 {name=p5 lab=gnd}
C {iopin.sym} 190 -250 3 1 {name=p6 lab=vdd}
