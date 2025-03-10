<Qucs Schematic 24.4.1>
<Properties>
  <View=509,142,2480,899,1.52444,0,0>
  <Grid=10,10,1>
  <DataSet=postLO_ngspice_test.dat>
  <DataDisplay=postLO_ngspice_test.dpl>
  <OpenDisplay=0>
  <Script=postLO_ngspice_test.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Vdc V1 1 1480 770 18 -26 0 1 "1.25 V" 1>
  <Vdc V2 1 1570 770 18 -26 0 1 "1.65 V" 1>
  <GND * 1 1580 570 0 0 0 0>
  <IProbe Input_curr1 1 1470 470 -26 16 0 0>
  <Lib npn13G1 1 1280 760 10 64 0 0 "/home/pedersen/.qucs/user_lib/IHP_PDK_nonlinear_components" 0 "npn13G2" 0 "10" 1>
  <GND * 1 1530 800 0 0 0 0>
  <GND * 1 1280 820 0 0 0 0>
  <GND * 1 1300 760 0 0 0 0>
  <IProbe Input_curr 1 800 590 -26 16 0 0>
  <R R2 1 1130 490 -26 15 0 0 "5 kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <INDQ LQ2 1 1010 670 17 -26 0 1 "103pH" 1 "13" 1 "50e9" 0 "Linear" 0 "26.85" 0>
  <INDQ LQ1 1 1300 350 17 -26 0 1 "320pH" 1 "13" 1 "50e9" 0 "Linear" 0 "26.85" 0>
  <C C1 1 920 590 -26 17 0 0 "43 fF" 1 "" 0 "neutral" 0>
  <C C2 1 1130 590 -26 17 0 0 "100 fF" 1 "" 0 "neutral" 0>
  <C C3 1 1390 470 -26 17 0 0 "160 fF" 1 "" 0 "neutral" 0>
  <.SP SP1 1 790 190 0 61 0 0 "lin" 1 "1 GHz" 1 "200 GHz" 1 "200" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <INCLSCR INCLSCR1 1 830 370 -60 16 0 0 ".LIB cornerHBT.lib hbt_typ\n" 1 "" 0 "" 0>
  <.DC DC1 1 970 190 0 36 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <GND * 1 740 680 0 0 0 0>
  <Pac P2 1 1580 520 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "50e9" 0 "26.85" 0 "true" 0>
  <Pac P1 1 740 640 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "50e9" 0 "26.85" 0 "true" 0>
  <SPfile X1 0 1400 620 -26 -68 0 0 "/home/pedersen/projects/IHP-AnalogAcademy/modules/module_2_50GHz_MPA/part_4_layout_EMsims/core_1/openems/output/run_core_50ghz_mpa_data/run_core_50ghz_mpa.s4p" 0 "rectangular" 0 "linear" 0 "open" 0 "4" 0>
</Components>
<Wires>
  <1010 590 1100 590 "" 0 0 0 "">
  <1010 590 1010 640 "" 0 0 0 "">
  <1010 700 1010 720 "" 0 0 0 "">
  <1160 490 1160 590 "" 0 0 0 "">
  <1100 490 1100 590 "" 0 0 0 "">
  <1570 720 1570 740 "" 0 0 0 "">
  <1480 800 1530 800 "" 0 0 0 "">
  <1480 700 1480 740 "" 0 0 0 "">
  <1300 380 1300 470 "" 0 0 0 "">
  <1420 470 1440 470 "" 0 0 0 "">
  <1300 470 1360 470 "" 0 0 0 "">
  <1300 300 1300 320 "" 0 0 0 "">
  <1160 590 1220 590 "" 0 0 0 "">
  <1300 470 1300 590 "" 0 0 0 "">
  <1280 590 1300 590 "" 0 0 0 "">
  <1220 760 1250 760 "" 0 0 0 "">
  <1290 760 1300 760 "" 0 0 0 "">
  <1280 810 1280 820 "" 0 0 0 "">
  <1530 800 1570 800 "" 0 0 0 "">
  <740 590 740 610 "" 0 0 0 "">
  <740 590 770 590 "" 0 0 0 "">
  <950 590 1010 590 "" 0 0 0 "">
  <830 590 890 590 "" 0 0 0 "">
  <740 670 740 680 "" 0 0 0 "">
  <1580 550 1580 570 "" 0 0 0 "">
  <1500 470 1580 470 "" 0 0 0 "">
  <1580 470 1580 490 "" 0 0 0 "">
  <1220 590 1220 760 "" 0 0 0 "">
  <1280 590 1280 710 "" 0 0 0 "">
  <1010 720 1010 720 "Vb" 1050 740 0 "">
  <1570 720 1570 720 "Vcc" 1600 690 0 "">
  <1480 700 1480 700 "Vb" 1510 670 0 "">
  <1300 300 1300 300 "Vcc" 1330 270 0 "">
  <740 590 740 590 "Vin" 730 550 0 "">
  <1580 470 1580 470 "Vo" 1610 440 0 "">
</Wires>
<Diagrams>
  <Smith 1860 570 200 200 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 1 0 0 "" "" "">
	<"ngspice/ac.v(s_1_1)" #0000ff 0 3 0 0 0>
	  <Mkr 5e+10 169 -198 3 0 0>
	<"ngspice/ac.v(s_2_2)" #ff0000 0 3 0 0 0>
	  <Mkr 5e+10 -210 -298 3 0 0>
  </Smith>
</Diagrams>
<Paintings>
</Paintings>
