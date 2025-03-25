v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -270 540 -270 {
lab=inout_2}
N 430 -420 540 -420 {
lab=inout_2}
N 540 -340 540 -270 {
lab=inout_2}
N 540 -340 580 -340 {
lab=inout_2}
N 540 -420 540 -340 {
lab=inout_2}
N 300 -420 370 -420 {
lab=inout_1}
N 300 -270 370 -270 {
lab=inout_1}
N 300 -340 300 -270 {
lab=inout_1}
N 400 -230 400 -200 {
lab=en_p}
N 400 -490 400 -460 {
lab=en_n}
N 400 -300 400 -270 {
lab=#net1}
N 400 -300 470 -300 {
lab=#net1}
N 400 -390 470 -390 {
lab=#net2}
N 400 -420 400 -390 {
lab=#net2}
N 250 -340 300 -340 {
lab=inout_1}
N 300 -420 300 -340 {
lab=inout_1}
N 250 -490 400 -490 {
lab=en_n}
N 250 -200 400 -200 {
lab=en_p}
N 470 -480 470 -390 {
lab=#net2}
N 470 -640 470 -540 {
lab=vdd}
N 470 -300 470 -210 {
lab=#net1}
N 470 -150 470 -80 {
lab=vss}
C {devices/iopin.sym} 250 -340 2 0 {name=p1 lab=inout_1
}
C {devices/iopin.sym} 580 -340 0 0 {name=p6 lab=inout_2

}
C {devices/ipin.sym} 250 -200 0 0 {name=p2 lab=en_p}
C {devices/iopin.sym} 470 -640 3 0 {name=p3 lab=vdd
}
C {devices/iopin.sym} 470 -80 1 0 {name=p4 lab=vss
}
C {sg13g2_pr/sg13_lv_nmos.sym} 400 -250 3 0 {name=M1
l=0.130u
w=200.0u
ng=20
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 400 -440 1 0 {name=M2
l=0.130u
w=200.0u
ng=20
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/ipin.sym} 250 -490 0 0 {name=p5 lab=en_n}
C {sg13g2_pr/ntap1.sym} 470 -510 0 0 {name=R1
model=ntap1
spiceprefix=X
R=262.847.0
Imax=0.3e-6
}
C {sg13g2_pr/ptap1.sym} 470 -180 2 0 {name=R2
model=ptap1
spiceprefix=X
R=262.847.0
Imax=0.3e-6
}
