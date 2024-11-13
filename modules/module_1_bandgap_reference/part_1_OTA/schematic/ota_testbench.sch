v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 575 -200 575 -170 {
lab=v+}
N 655 -200 655 -170 {
lab=v-}
N 735 -200 735 -170 {
lab=vdd}
N 735 -110 735 -90 {
lab=GND}
N 655 -90 735 -90 {
lab=GND}
N 655 -110 655 -90 {
lab=GND}
N 575 -90 655 -90 {
lab=GND}
N 575 -110 575 -90 {
lab=GND}
N 655 -90 655 -70 {
lab=GND}
N 345 -300 345 -280 {
lab=GND}
N 345 -445 345 -430 {
lab=vdd}
N 190 -405 210 -405 {
lab=v+}
N 190 -320 210 -320 {
lab=v-}
N 260 -275 260 -215 {
lab=#net1}
N 310 -195 310 -140 {
lab=GND}
N 260 -155 260 -140 {
lab=GND}
N 295 -285 310 -285 {
lab=#net2}
N 310 -285 310 -255 {
lab=#net2}
N 510 -365 620 -365 {
lab=vout}
N 555 -305 555 -290 {
lab=GND}
N 510 -365 515 -65 {
lab=vout}
N 330 -65 515 -65 {
lab=vout}
N 210 -65 275 -65 {
lab=v-}
N 210 -320 210 -65 {
lab=v-}
N 210 -5 210 5 {
lab=GND}
C {two_stage_OTA.sym} 360 -365 0 0 {name=x1}
C {vsource.sym} 575 -140 0 0 {name=V1 value= 0.6 AC 1
}
C {vsource.sym} 655 -140 0 0 {name=V2 value= 0.6 AC 1}
C {vsource.sym} 735 -140 0 0 {name=VDD value=1.2}
C {gnd.sym} 655 -70 0 0 {name=l1 lab=GND}
C {gnd.sym} 345 -280 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 345 -445 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 735 -200 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 575 -200 0 0 {name=p3 sig_type=std_logic lab=v+}
C {lab_pin.sym} 655 -200 0 0 {name=p4 sig_type=std_logic lab=v-}
C {lab_pin.sym} 190 -405 0 0 {name=p5 sig_type=std_logic lab=v+}
C {lab_pin.sym} 190 -320 0 0 {name=p6 sig_type=std_logic lab=v-}
C {isource.sym} 260 -185 0 0 {name=I0 value=2.78u}
C {isource.sym} 310 -225 0 0 {name=I1 value=6.28u}
C {gnd.sym} 260 -140 0 0 {name=l3 lab=GND}
C {gnd.sym} 310 -140 0 0 {name=l4 lab=GND}
C {capa.sym} 555 -335 0 0 {name=Cload
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 555 -290 0 0 {name=l5 lab=GND}
C {iopin.sym} 620 -365 0 0 {name=p7 lab=vout}
C {devices/code_shown.sym} -340 -190 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} -365 -515 0 0 {name=NGSPICE only_toplevel=true 
value="
.control
op 
ac dec 20 1 1e9 
save all
let Av = db(v(vout))
write output_file.raw 
.endc
"}
C {devices/code_shown.sym} -385 -300 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
"}
C {ind.sym} 300 -65 3 1 {name=L6
m=1
value=100
footprint=1206
device=inductor}
C {capa.sym} 210 -35 0 0 {name=C1
m=1
value=100
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 210 5 0 0 {name=l7 lab=GND}
