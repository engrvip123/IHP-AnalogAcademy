# Module 0 - Foundations


Welcome to the first module in the IHP open PDK analog course. 

### Module Overview
1. Setup and verification of the tools
2. Overview of the PDK ??
3. Simulating in Xschem using Ngspice
4. Notes on the design flow
5. Setting up gm/id (Optional)


## Setup and verification

For installing at setting up the tools, with the IHP open PDK, installation guides can be found in the read-the-docs, given by the following link below:

1. **Read The Docs link**
   ```bash
   https://ihp-open-pdk-docs.readthedocs.io/en/latest/index.html 
   
```
Following the installation procedure you should now be able to launch xschem by typing the following in the terminal


1. **Open Xschem**
   ```bash
   xschem & 
   
```
When lauching Xschem the first window you should should look something like this:

![[Pasted image 20241017155312.png]]

This is generated testcases included in the IHP PDK that shows examples of how to make different kinds of simulations. Below you will se an overview of each fan.


1. **DC:**  used to describe steady state operation of devices (Operating point, device characterization etc...)
2. **Transient**: used to describe the behavior of devices in the time domain  i.e. how devices operate over time and how they response to changes in the input
3. **AC**: used to describe the frequency response of devices, i.e deciding cutoff frequencies, phase shift etc...
4. **Monte Carlo**: used as a statistical tool to describe how devices vary in performance with relation to random influences. This could for example be how a comparator changes its offset in relation to manufacturing variations
5. **S-Param**: used to describe high frequency behavior of devices, more specifically compared to the AC, S-parameters describe a complete network in terms of reflection and transmission. This is particularly used in radio frequency (RF) design. 


In the overview you can navigate through the different design to see how different simulations are setup, however we will cover most of this in detail throughout the course, its still a good idea to probe the terrain. For instance try opening the **dc_lv_nmos** by clicking on the instance and pressing ''e''. Now you have descended into the schematic!

From here you should navigate to the button that says, "netlist" in the top right corner, and the press simulate afterwards, and voila, you have simulated your first schematic in xschem. You can view the results by left clicking on the green arrow while holding down Ctrl. You should see something like this:

![[Pasted image 20241017162220.png]]
If you think that the dark mode theme is too unclear, you can toggle this by pressing "shift + o". 


## Notes on the design flow

When working with analog design, many parameters has to be taken into account, and a solid foundation in regards to analog electronics is mandatory in order to produce well performing and robust structures. In this course we wont rely on small signal calculations using square law models, (even though these calculations are important for conceptualizing and understanding) instead we will design with the aid of the gm/id methods. Basically this method utilizes the model parameters to give us look up tables from where we can design with our figure of metrices. If you are interested in the design procedures for the circuits, the individual Jupiter notebook scripts are provided in the modules, and can be used as reference on how to embark on more "advanced" IC design with the open source tools. 

If you are interested in learning more about the gm/id method, you can refer to the following video by **Mastering Microelectronics**: https://www.youtube.com/watch?v=dzz4z3ijVts

To setup the gm/id tools with pygmid refer to the next chapter.




## Setting up gm/id (Optional)

For setting up gm/id tools we refer to the pygmid repository provided by the following 

URL: https://github.com/dreoilin/pygmid

Switch the branch to Ngspice and clone the repository in a destination of your choice. Refer to the installation procedure in the readme. Now for generating the lookup table first create your config file with the listed parameters. For inspiration i show a config file that takes the two low voltage devices, sg13_lv_nmos and the equivalent pmos and sweeps them with the parameters shown under the sweep section. Remember to change the  file path to fit with your enviroment

   ```bash
[MODEL]
file = /...../IHP-Open-PDK/ihp-sg13g2/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
info = 130nm CMOS, IHP Open Source PDK, SPICE
corner = NOM
temp = 300
modeln = sg13_lv_nmos
modelp = sg13_lv_pmos
savefilen = 130n1vrvt
savefilep = 130p1vrvt
paramfile = params.lib

[SWEEP]
#	(start	,step,stop)
VGS = 	(0,20e-3,1.2)
VDS = (0,25e-3,1.2)
VSB = (0,0.2,1)
#LENGTH = [(0.13,0.02,0.5), (0.6, 0.1, 2), (2.5,0.5,10), (11,1,20)]
LENGTH = [(0.13,0.987,10)]
WIDTH = 1
NFING = 1

[SETTINGS]
RAW_INCLUDE = ['pre_osdi ./psp103_nqs.osdi']
SIMULATOR = ngspice
 
   
```

Now you can sweep the conf file by applying the following command:


   ```bash
python -m pygmid --mode sweep --config <config.cfg>
   
```

Now the this will generate a pkl file that will work as you lookup table. To test this follow the example given in the jupyterlab document (gm/id verification) in the current module.
