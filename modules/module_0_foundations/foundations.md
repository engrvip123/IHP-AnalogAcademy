# Module 0 - Foundations

Welcome to the first module in the IHP Open PDK analog design course.
Module Overview

- Setup and Verification of Tools
- Notes on the Design Flow
- Setting Up gm/Id Methodology (Optional)
- Verifying gm/Id Design in Xschem (Optional)

## Setup and Verification of Tools

To install and set up the tools for working with the IHP Open PDK, refer to the installation guides in the ReadTheDocs link below:
   ```
    https://ihp-open-pdk-docs.readthedocs.io/en/latest/index.html
   ```
After following the installation steps, you should be able to launch Xschem by entering the following command in your terminal:

    xschem

Upon launching, the initial Xschem window should appear as follows:
<p align="center"> <img src="../../media/Pasted image 20241017155312.png" width="800" height="400" /> </p>

This view includes test cases within the IHP PDK, demonstrating different types of simulations. Below is an overview of each type:

- DC Analysis: Evaluates steady-state operation of devices, such as operating points and device characterization.
- Transient Analysis: Assesses time-domain behavior, showing device operation over time and response to input changes.
- AC Analysis: Examines frequency response, including cutoff frequencies and phase shift.
- Monte Carlo Analysis: Provides statistical data on device performance variability due to random influences, such as manufacturing deviations.
- S-Parameter Analysis: Focuses on high-frequency behavior, describing network reflection and transmission, useful in RF design.

The simulation library allows you to explore different designs and understand the simulation setups, which will be covered in detail throughout the course. To get started, try opening dc_lv_nmos by selecting the instance and pressing e. This will open the schematic view.

From here, navigate to the "netlist" button in the top-right corner, then press "simulate." Your first schematic simulation in Xschem will now be complete. View the results by left-clicking the green arrow while holding down Ctrl. The output should look like this:
<p align="center"> <img src="../../media/Pasted image 20241017162220.png" width="800" height="400" /> </p>

If the dark mode theme is hard to read, you can toggle it by pressing "Shift + O."
## Notes on the Design Flow

Analog design requires a solid foundation in analog electronics to ensure high-performance, robust designs. In this course, we will focus on the gm/Id methodology rather than traditional small-signal calculations using square-law models. This method uses model parameters to generate lookup tables, enabling a more data-driven approach to design. If you're interested in understanding the circuit design procedures in greater detail, each module includes Jupyter Notebook scripts as references for more advanced IC design using open-source tools.

For a deeper dive into the gm/Id methodology, consider watching this video by Mastering Microelectronics: https://www.youtube.com/watch?v=dzz4z3ijVts

Refer to the next section for instructions on setting up the gm/Id tools using pygmid.
## Setting Up gm/Id Methodology (Optional)

To set up the gm/Id tools, access the pygmid repository:

Repository URL: https://github.com/dreoilin/pygmid

Switch to the "Ngspice" branch and clone the repository to a destination of your choice. Follow the installation instructions in the README. To generate the lookup table, create a configuration file specifying parameters. Below is a sample configuration file to sweep the low-voltage devices, sg13_lv_nmos and sg13_lv_pmos, with relevant parameters:

```

[MODEL]
file = /path/to/IHP-Open-PDK/ihp-sg13g2/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
info = 130nm CMOS, IHP Open Source PDK, SPICE
corner = NOM
temp = 300
modeln = sg13_lv_nmos
modelp = sg13_lv_pmos
savefilen = 130n1vrvt
savefilep = 130p1vrvt
paramfile = params.lib

[SWEEP]
VGS = (0, 20e-3, 1.2)
VDS = (0, 25e-3, 1.2)
VSB = (0, 0.2, 1)
LENGTH = [(0.13, 0.987, 10)]
WIDTH = 1
NFING = 1

[SETTINGS]
RAW_INCLUDE = ['pre_osdi ./psp103_nqs.osdi']
SIMULATOR = ngspice
```
To run the sweep, execute the following command:

```
python -m pygmid --mode sweep --config <config.cfg>
```

This command will generate a .pkl file that serves as the lookup table. To test the table, navigate to the scripting folder in this module and open gmid_commonsource.ipynb.

Note: Ensure the paths to sg13g2_nmos_lv and sg13g2_pmos_lv are correctly referenced in your config file, and modify the LUT path in the script to point to the location of your lookup tables.

## Verifying gm/Id Design in Xschem (Optional)

To verify the design created using the lookup tables, start by identifying key parameters to validate, such as DC gain and the first pole. This requires creating a frequency analysis simulation to capture both characteristics. Begin by creating a new schematic in some specified folder:

```
touch gmid_test.sch
```

From here you launch this schematic by typing

```
xschem gmid_test.sch
```

the first thing we want to do is the instanciate our mosfets. In this example we make a current mirror for biasing our output transistor to the right operation. Therefore we will need to instanciate two MOSFETS. This is done by navigating to the insert symbol botton, with a nandgate as its icon. Or you can press shift+i. Here you want to click the IHP open pdk path, and click on "sg13g2_pr". Here you should select the "sg13_lv_nmos.sym", and press OK. Now you will place it and duplicate it by pressing it and clicking "c". Now you can press shift+f while toggeling the instance for flipping it and place it in a gate to gate configuration as shown in the image:


<p align="center"> <img src="../../media/Screenshot 2024-10-29 093228.png" width="550" height="350" /> </p>
select each instance and press Q to change the widht and the length to the parameters found in the gmid script.


Now you should conncect the bulk of the devices to the sources with a wire, by pressing "w" and dragging the wire to its location. After this navigate to the symbol library, again by pressing and instanciate the following items:

- xschem_library/devices -> search: gnd -> gnd.sym
- xschem_library/devices -> search: res -> res.sym
- xschem_library/devices -> search: cap -> capa-2.sym
- xschem_library/devices -> search: isource -> isource.sym
- xschem_library/devices -> search: vsource -> vsource.sym (duplicate this item)

From here you should connect the individual components so you have the same setup as seen in the following image:








