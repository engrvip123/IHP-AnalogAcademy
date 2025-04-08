v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 230 -790 230 -760 {lab=vdd}
N 230 -790 430 -790 {lab=vdd}
N 430 -790 430 -760 {lab=vdd}
N 270 -730 430 -610 {lab=#net1}
N 430 -700 430 -610 {lab=#net1}
N 230 -700 230 -610 {lab=#net2}
N 230 -610 390 -730 {lab=#net2}
N 430 -790 610 -790 {lab=vdd}
N 610 -790 610 -760 {lab=vdd}
N 610 -640 610 -590 {lab=#net3}
N 610 -640 890 -640 {lab=#net3}
N 610 -790 760 -790 {lab=vdd}
N 760 -790 760 -760 {lab=vdd}
N 710 -730 720 -730 {lab=gp}
N 550 -730 570 -730 {lab=#net2}
N 760 -440 760 -410 {lab=#net4}
N 760 -550 760 -500 {lab=#net5}
N 430 -610 430 -590 {lab=#net1}
N 230 -610 230 -590 {lab=#net2}
N 610 -530 610 -510 {lab=#net6}
N 610 -510 1010 -510 {lab=#net6}
N 760 -550 1040 -550 {lab=#net5}
N 760 -700 760 -550 {lab=#net5}
N 610 -700 610 -640 {lab=#net3}
N 920 -640 920 -630 {lab=#net3}
N 890 -630 920 -630 {lab=#net3}
N 890 -640 890 -630 {lab=#net3}
N 1100 -510 1120 -510 {lab=vi}
N 1150 -640 1170 -640 {lab=#net7}
N 1230 -640 1260 -640 {lab=#net8}
N 1320 -640 1340 -640 {lab=gnd}
N 1150 -640 1150 -550 {lab=#net7}
N 950 -640 1150 -640 {lab=#net7}
N 1100 -510 1100 -410 {lab=vi}
N 1070 -510 1100 -510 {lab=vi}
N 230 -530 230 -160 {lab=clk_not}
N 430 -530 430 -410 {lab=#net9}
N 610 -510 610 -260 {lab=#net6}
N 570 -380 570 -160 {lab=clk_not}
N 570 -380 720 -380 {lab=clk_not}
N 610 -200 610 -160 {lab=gnd}
N 330 -270 370 -270 {lab=vdd}
N 490 -270 510 -270 {lab=gnd}
N 430 -230 430 -160 {lab=clk_not}
N 230 -160 430 -160 {lab=clk_not}
N 920 -720 920 -680 {lab=#net10}
N 760 -350 760 -320 {lab=gnd}
N 1180 -510 1240 -510 {lab=vo}
N 760 -790 1060 -790 {lab=vdd}
N 1060 -660 1060 -650 {lab=gnd}
N 1060 -790 1060 -780 {lab=vdd}
N 1060 -790 1200 -790 {lab=vdd}
N 1200 -790 1200 -680 {lab=vdd}
N 1100 -720 1120 -720 {lab=gp}
N 1290 -710 1290 -680 {lab=clk_not}
N 760 -470 820 -470 {lab=gnd}
N 760 -380 820 -380 {lab=gnd}
N 430 -730 470 -730 {lab=gnd}
N 180 -730 230 -730 {lab=gnd}
N 1150 -510 1150 -450 {lab=gnd}
N 1040 -510 1040 -450 {lab=gnd}
N 760 -730 810 -730 {lab=vdd}
N 610 -730 650 -730 {lab=gnd}
N 1200 -640 1200 -600 {lab=gnd}
N 1290 -640 1290 -600 {lab=gnd}
N 610 -230 710 -230 {lab=gnd}
N 390 -750 390 -730 {lab=#net2}
N 390 -750 550 -750 {lab=#net2}
N 550 -750 550 -730 {lab=#net2}
N 980 -390 980 -360 {lab=vdd}
N 980 -240 980 -210 {lab=gnd}
N 1120 -300 1150 -300 {lab=clk_not}
N 910 -300 940 -300 {lab=clk}
N 430 -160 570 -160 {lab=clk_not}
N 690 -470 720 -470 {lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 410 -730 0 0 {name=M1
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 250 -730 0 1 {name=M3
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 920 -660 3 1 {name=M4
l=0.13u
w=500n
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 590 -730 0 0 {name=M2
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 740 -730 0 0 {name=M6
l=130n
w=500n
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 740 -470 0 0 {name=M5
l=0.13u
w=3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 740 -380 0 0 {name=M7
l=0.13u
w=3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/cap_cmim.sym} 230 -560 0 0 {name=C5
model=cap_cmim
w=4.665e-6
l=6.99e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 610 -560 0 0 {name=C6
model=cap_cmim
w=11.485e-6
l=11.485e-6
m=1
spiceprefix=X}
C {sg13g2_pr/sg13_lv_nmos.sym} 1040 -530 3 1 {name=M8
l=0.13u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1150 -530 1 0 {name=M9
l=0.13u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1200 -660 1 0 {name=M10
l=0.13u
w=500n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1290 -660 1 0 {name=M11
l=0.13u
w=500n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 590 -230 0 0 {name=M12
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 570 -860 0 0 {name=p2 lab=gnd}
C {iopin.sym} 630 -860 0 0 {name=p3 lab=vdd}
C {iopin.sym} 690 -860 0 0 {name=p4 lab=vi}
C {iopin.sym} 750 -860 0 0 {name=p5 lab=vo}
C {lab_pin.sym} 330 -270 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 230 -790 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 810 -730 0 1 {name=p7 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 820 -380 0 1 {name=p8 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 820 -470 0 1 {name=p9 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 710 -230 0 1 {name=p10 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 470 -730 0 1 {name=p11 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 180 -730 0 0 {name=p12 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 1290 -600 3 0 {name=p13 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 1200 -600 1 1 {name=p14 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 1150 -450 1 1 {name=p15 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 1040 -450 1 1 {name=p16 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 1100 -410 1 1 {name=p17 sig_type=std_logic lab=vi}
C {lab_pin.sym} 1240 -510 2 0 {name=p18 sig_type=std_logic lab=vo}
C {lab_pin.sym} 1290 -710 2 0 {name=p19 sig_type=std_logic lab=clk_not}
C {lab_pin.sym} 230 -160 2 1 {name=p20 sig_type=std_logic lab=clk_not}
C {lab_pin.sym} 510 -270 0 1 {name=p21 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 650 -730 0 1 {name=p23 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 760 -320 0 1 {name=p24 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 710 -730 3 0 {name=p25 sig_type=std_logic lab=gp}
C {lab_pin.sym} 1120 -720 3 0 {name=p26 sig_type=std_logic lab=gp}
C {iopin.sym} 800 -860 0 0 {name=p27 lab=clk}
C {lab_pin.sym} 1150 -300 0 1 {name=p28 sig_type=std_logic lab=clk_not}
C {lab_pin.sym} 910 -300 0 0 {name=p29 sig_type=std_logic lab=clk}
C {lab_pin.sym} 980 -390 0 0 {name=p30 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 980 -210 0 0 {name=p31 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 1340 -640 0 1 {name=p32 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 610 -160 0 1 {name=p33 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 690 -470 0 0 {name=p34 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 1060 -650 0 1 {name=p35 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 430 -560 0 0 {name=C1
model=cap_cmim
w=4.665e-6
l=6.99e-6
m=1
spiceprefix=X}
C {/home/pedersen/projects/IHP-AnalogAcademy/modules/module_3_8_bit_SAR_ADC/part_2_digital_comps/bootstrap_switch/schematic/inverter.sym} 430 -250 3 0 {name=x1}
C {/home/pedersen/projects/IHP-AnalogAcademy/modules/module_3_8_bit_SAR_ADC/part_2_digital_comps/bootstrap_switch/schematic/inverter.sym} 1080 -720 0 1 {name=x2}
C {/home/pedersen/projects/IHP-AnalogAcademy/modules/module_3_8_bit_SAR_ADC/part_2_digital_comps/bootstrap_switch/schematic/inverter.sym} 960 -300 0 0 {name=x3}
