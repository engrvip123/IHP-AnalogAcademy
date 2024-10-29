# Bandgap design

In integrated circuit (IC) design many circuits require a fixed stable, temperature independent voltage fixation in order to have a constant voltage reference.
The use case for these stable references, could be used to provide a stable reference to data converters or bias operating points. These circuits is also called Bandgap References or in short BGR. 
They work by summing a proportional to absolute temperature device with a complementary proportional to absolute temperature device together, or in other words: The bandgap reference is comprised of two 
devices with opposite temperature coefficients within a given interval of interest.

 One of devices that exhibits inherent negative TC s is the bipolar junction transistor (BJT). The relation of the base to emitter voltage can be described with the following equation given as:

$$V_{BE} = V_T \cdot ln(\frac{I_C}{I_S})$$

Where $I_C$ is the collector current and $I_S$ is the saturation current. From this we want to generate a positive TC in order to fulfill the criteria given in the figure above. 
The theory behind different circuit topology regarding the bandgap references are quite comprehensive, and will therefore not be covered here. Instead the circuit seen below is proposed:

