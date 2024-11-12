v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 190 -550 190 -390 {
lab=#net1}
N 190 -320 190 -300 {
lab=GND}
N 190 -360 200 -360 {
lab=GND}
N 200 -360 200 -320 {
lab=GND}
N 190 -320 200 -320 {
lab=GND}
N 190 -330 190 -320 {
lab=GND}
N 90 -480 90 -460 {
lab=GND}
N 90 -550 90 -540 {
lab=#net1}
N 90 -550 190 -550 {
lab=#net1}
N 90 -280 90 -260 {
lab=GND}
N 90 -360 90 -340 {
lab=#net2}
N 90 -360 150 -360 {
lab=#net2}
C {devices/code_shown.sym} -280 -270 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} -290 -420 0 0 {name=NGSPICE only_toplevel=true 
value="
.control
op
write output_file.raw 
.endc
"}
C {sg13g2_pr/sg13_lv_nmos.sym} 170 -360 2 1 {name=M3
l=3.25u
w=3.33u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/gnd.sym} 190 -300 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 90 -510 0 0 {name=Vdd1 value= 0.6}
C {devices/gnd.sym} 90 -460 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 90 -310 0 0 {name=Vdd2 value= 0.27}
C {devices/gnd.sym} 90 -260 0 0 {name=l4 lab=GND}
