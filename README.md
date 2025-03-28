# IHP-AnalogAcademy
<p align="center">
  <img src="media/ihp-logo.jpg"  width="600" height="400" />
</p>


## Introduction

Welcome to the IHP-AnalogAcademy course! This repository contains a series of exercises and tutorials designed to guide you through various topics related to analog IC design using the IHP Open PDK (Process Design Kit). The goal of this course is to help you gain hands-on experience with both circuit design and layout, as well as to provide a deeper understanding of analog design methodologies.

The course is broken down into several modules, with each module building on the knowledge and skills from the previous one. Each module will contain a mix of theory, practical exercises, and challenges to complete, with ample documentation to guide you along the way.

---

## Table of Contents

1. [Module 0: Introduction to the IHP Open PDK](#module-0-introduction-to-the-ihp-open-pdk)
2. [Module 1: Inverter Design and Simulation](#module-1-inverter-design-and-simulation)
3. [Module 2: Physical Design and Layout](#module-2-physical-design-and-layout)
4. [Module 3: Operational Transconductance Amplifier (OTA) Design](#module-3-operational-transconductance-amplifier-ota-design)
5. [Module 4: Bandgap Voltage Reference Design](#module-4-bandgap-voltage-reference-design)
6. [Module 5: Layout Competition and Design Verification](#module-5-layout-competition-and-design-verification)
7. [Advanced Topics: gm/Id Methodology](#advanced-topics-gmid-methodology)
8. [Appendix](#appendix)

---

## Module 0: Introduction to the IHP Open PDK

In this module, you'll get familiar with the IHP Open PDK, an essential toolset for analog IC design. We start by setting up your environment and creating the first schematic in Xschem. Here's the basic workflow:

1. **Creating Your First Schematic**: Start by creating a schematic in the `xschem` environment.
   - Navigate to your desired location and create the schematic.
   - Organize components, instantiate libraries, and connect components.

2. **Netlist Extraction**: Learn how to extract the netlist from your schematic and how the simulator interprets it.
   - Use the `.subckt` definitions for different subcircuits.
   - Ensure proper formatting for compatibility with ngspice.

3. **Simulation Setup**: Set up simulations in Xschem and use ngspice for accurate circuit analysis.
   - Define the input voltages, components, and transistor models.

4. **Opening and Viewing the Schematic**: Learn how to open your schematic in Xschem, search for components, and check the simulation results.

---

## Module 1: Inverter Design and Simulation

In this module, you will design a basic CMOS inverter and perform simulations to verify its functionality. Here's the workflow:

1. **Inverter Schematic**: Create an inverter circuit using NMOS and PMOS transistors.
   - Start with defining the transistor models and component sizes (e.g., `w=1.0u l=0.45u` for NMOS).
   
2. **Running Simulations**: Perform DC and transient simulations to evaluate the inverter's performance.

3. **Creating Testbench for Inverter**: Set up a testbench to verify your inverter design.
   - Explore how to link your schematic to a simulation environment (e.g., ngspice).
   
4. **Layout Design**: Once the inverter is functioning correctly in simulation, move on to a simple layout of the inverter.

5. **Physical Verification**: Although this step isn't mandatory at this point, it is helpful to check the layout for any design rule violations.

---

## Module 2: Physical Design and Layout

This module teaches you the process of translating your schematic into a layout and performing design rule checks (DRC). The workflow is as follows:

1. **Layout Creation**: After successfully simulating the inverter, create a layout version of the circuit.
   - Use the correct grid and component placement for layout.
   
2. **Moving Components**: Learn how to move and place components within your layout editor.
   - Use the scaling function (F) to adjust the view and align components.
   
3. **Running DRC and LVS**: Perform design rule checks (DRC) and layout versus schematic (LVS) checks to ensure the layout adheres to fabrication constraints.
   - Understand the difference between the "Max" and "Min" DRC decks and when to use each.

---

## Module 3: Operational Transconductance Amplifier (OTA) Design

In this module, we focus on designing an Operational Transconductance Amplifier (OTA). You will perform the following analyses:

1. **DC Analysis**: Analyze the DC operating points of the OTA and ensure it is biased correctly.
2. **AC Analysis**: Perform an AC analysis to investigate the frequency response and stability of the amplifier.
3. **Design Metrics**: Measure the key design metrics such as transconductance (gm), gain, and power consumption.

---

## Module 4: Bandgap Voltage Reference Design

This module introduces you to the design of a bandgap voltage reference (BGR) circuit.

1. **DC and Transient Analysis**: Perform DC analysis to check the voltage reference's operating point and transient analysis for its dynamic behavior.
2. **Mismatch Analysis**: Use Monte Carlo simulations to analyze the effects of process variation on your bandgap reference.
   
---

## Module 5: Layout Competition and Design Verification

This module brings together all the skills you’ve learned in the previous modules and culminates in a friendly layout competition.

1. **Inverter Layout Challenge**: Compete to design the best layout for an inverter, optimizing for minimal DRC and LVS errors.
   
2. **Final Layout Review**: Review the final layouts and compare the results to industry standards.
   
3. **Going to Tape-Out**: Discuss the final steps of the design process, including the transition from layout to tape-out for fabrication.

---

## Advanced Topics: gm/Id Methodology

The `gm/Id` methodology is a powerful design approach for optimizing the performance of analog circuits. This optional section introduces you to using the `gmid` toolset:

1. **Installing and Using `gmid`**: Learn how to set up the `gmid` tool and use it to generate lookup tables (LUTs) for your transistors.
   
2. **LUT Generation**: Use the GUI to select the transistor you want to analyze and specify the sweeping parameters.
   
3. **Viewing the Data**: Open the generated LUTs in the provided JupyterLab GUI to analyze the results.

---

## Appendix

### Additional Resources

- [Ngspice Manual](http://ngspice.sourceforge.io/docs/ngspice-manual.pdf)
- [IHP Open PDK Documentation](https://www.ihp-microelectronics.com/en/technologies/)
- [gm/Id Methodology Repository](https://github.com/medwatt/gmid)

### Useful Commands

- To run the `gmid_launcher.py`, use the following command:
  ```bash
  python gmid_launcher.py
 
