# Selecting the BJT Operating Point

The first step in designing the bandgap reference in the structure we are working with is to select the appropriate relationship between the transistors Q1 and Q2 to achieve a suitable n-factor, while considering layout constraints. A 1:8 ratio with n = 8 provides favorable conditions for creating a robust common centroid layout, which will be discussed in more detail later.

For the current bias, we assume a value of:

$$I_{D3}=25\mu A$$

and for the resistor value:

$$R_3 = 45k\Omega$$

From here lets investigate the resulting change in Vbe as the temperature varies from -30°C to 100°C. For this we create a new schematic given as 

```
 touch vbesim.sch
```

In this schematic we want to instaciate the following

- res.sym -->> values = 45k
- sg13g2_pr/pnpMPA.sym -->> $w = 5.0\mu m \ \ l = 5.0\mu m$
- isource.sym -->> name=I0 value=25e-6
- vsource.sym -->> name=V1 value=1.2 savecurrent=false
