v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 180 -100 180 -80 {
lab=GND}
N 180 -240 180 -200 {
lab=Vbe}
N 180 -240 360 -240 {
lab=Vbe}
N 360 -150 360 -140 {
lab=#net1}
N 360 -80 360 -70 {
lab=GND}
N 360 -240 360 -210 {
lab=Vbe}
N 140 -170 140 -100 {
lab=GND}
N 140 -100 180 -100 {
lab=GND}
N 180 -140 180 -100 {
lab=GND}
N 80 -240 180 -240 {
lab=Vbe}
N 80 -180 80 -160 {
lab=GND}
N 360 -240 410 -240 {
lab=Vbe}
C {devices/gnd.sym} 180 -80 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 80 -160 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 360 -70 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} -370 -420 0 0 {name=NGSPICE DC Vbe Sim only_toplevel=true 
value="
.control
.save #net1
.save #net2
op
dc TEMP -50 100 5
set wr_singlescale
set wr_vecnames
wrdata vbe_tempvar.txt Vbe
.endc

"}
C {res.sym} 80 -210 0 0 {name=R1
value=45k
footprint=1206
device=resistor
m=1}
C {isource.sym} 360 -180 2 0 {name=I0 value=25e-6}
C {sg13g2_pr/pnpMPA.sym} 160 -170 0 0 {name=Q2
model=pnpMPA
spiceprefix=X
w=5.0u
l=5.0u
}
C {vsource.sym} 360 -110 0 0 {name=V1 value=1.2 savecurrent=false}
C {devices/code_shown.sym} -460 -90 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerHBT.lib hbt_typ
"}
C {lab_pin.sym} 410 -240 0 1 {name=p1 sig_type=std_logic lab=Vbe}
