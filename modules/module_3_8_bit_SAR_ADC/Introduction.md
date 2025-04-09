Introduction to SAR ADCs

Successive Approximation Register (SAR) ADCs are a type of Nyquist-rate analog-to-digital converter known for their excellent balance between resolution, power efficiency, and area. Unlike flash or integrating ADCs, SAR ADCs use a sequential binary search algorithm to resolve each bit of the input signal. This makes them especially suitable for moderate-speed, low-power applications, and ideal for deep submicron CMOS processes where digital circuitry scales well.

At the heart of a SAR ADC lies a comparator, capacitive DAC (C-DAC), and control logic, working together to iteratively approximate the input voltage. A differential SAR structure improves noise immunity and dynamic range, which is the focus in this context.

A key component is the charge redistribution technique used in the C-DAC, which determines the power and area efficiency. While conventional switching is straightforward, it results in high energy usage due to unnecessary charge and discharge cycles. To address this, monotonic switching schemes are employed. They allow direct sampling on top plates, reducing total capacitance and energy consumption—using as little as 18.7% of the energy compared to conventional methods.

However, top-plate sampling introduces common-mode variation at the comparator input, potentially affecting linearity due to input-referred offset. This trade-off must be carefully managed in high-performance ADC designs.

In this chapter, we’ll explore the structure, operation, and optimization techniques for SAR ADCs, with a focus on energy-efficient charge redistribution and practical implementation in modern processes.

