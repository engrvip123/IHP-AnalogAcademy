import sys
import numpy as np
import matplotlib.pyplot as plt
import scienceplots
import os
plt.style.use(['science', 'ieee'])

def extract_variable_data(file_path, var_name):
    with open(file_path, "r") as file:
        lines = file.readlines()

    data = {}
    current_key = None
    collecting_data = False

    for line in lines:
        line = line.strip()

        if line.startswith("<indep") or line.startswith("<dep"):
            parts = line.split()
            current_key = parts[1]  # Extract variable name
            data[current_key] = []
            collecting_data = True
            continue

        if line.startswith("</"):
            collecting_data = False
            continue

        if collecting_data and current_key:
            if "+j" in line or "-j" in line:  # Handle complex numbers
                real, imag = line.split("+j") if "+j" in line else line.split("-j")
                imag = "-" + imag if "-j" in line else imag
                data[current_key].append(complex(float(real), float(imag)))
            else:
                data[current_key].append(float(line))

    if var_name in data:
        return np.array(data[var_name])
    else:
        raise ValueError(f"Variable '{var_name}' not found in the file.")

# If no arguments are passed, print the explanation
if len(sys.argv) == 1:
    print("This script processes and extracts variables from a specified dataset file.")
    print("You can use the script in the following ways:")
    print("1. To list all independent and dependent variables in the dataset:")
    print("   python3 script.py <file_path>")
    print("2. To print all values for a specific variable:")
    print("   python3 script.py <file_path> <variable_name>")
    print("3. To run the analysis and generate plots, pass the following arguments:")
    print("   python3 script.py <file_path> <vout_var> <vin_var> <iin_var> <iout_var> <sweep_var> <freq_interest> [xlim_min xlim_max]")
    sys.exit(0)

# Check if the script is run with just the path or a single variable argument
if len(sys.argv) == 2:
    file_path = sys.argv[1]
    print(f"Provided file path: {file_path}")
    
    # Extract independent and dependent variables from the file
    with open(file_path, "r") as file:
        lines = file.readlines()

    indep_vars = []
    dep_vars = []

    for line in lines:
        line = line.strip()

        if line.startswith("<indep"):
            parts = line.split()
            indep_vars.append(parts[1])  # Extract variable name

        if line.startswith("<dep"):
            parts = line.split()
            dep_vars.append(parts[1])  # Extract variable name

    # Print extracted variable names in a clean format
    print("\nIndependent Variables:")
    print("\n".join(f" - {var}" for var in indep_vars) if indep_vars else "None")

    print("\nDependent Variables:")
    print("\n".join(f" - {var}" for var in dep_vars) if dep_vars else "None")

    sys.exit(0)

# If script is run with the full set of arguments, proceed with the usual process
if len(sys.argv) < 8:
    print("Usage: python3 script.py <file_path> <vout_var> <vin_var> <iin_var> <iout_var> <sweep_var> <freq_interest> [xlim_min xlim_max] [ylim_min ylim_max]")
    sys.exit(1)

file_path = sys.argv[1]
vout_var = sys.argv[2]
vin_var = sys.argv[3]
iin_var = sys.argv[4]
iout_var = sys.argv[5]
sweep_var = sys.argv[6]
freq_interest = float(sys.argv[7])

# Default value for xlim
xlim = None

# Check if xlim is provided
if len(sys.argv) == 9:
    xlim = [float(sys.argv[8]), float(sys.argv[9])]

# Extract data
Vout_complex = extract_variable_data(file_path, vout_var)
Vin_complex = extract_variable_data(file_path, vin_var)
Iin_complex = extract_variable_data(file_path, iin_var)
Iout_complex = extract_variable_data(file_path, iout_var)
Freq = extract_variable_data(file_path, "FREQ")  # Frequency is hardcoded to "FREQ"
Sweep = extract_variable_data(file_path, sweep_var)

# Determine sizes
N = len(Vout_complex)
B = len(Sweep)

values_per_section = N // B
if N % B != 0:
    raise ValueError(f"Cannot divide {N} elements into {B} equal sections.")

# Reshape into sections
Vin_sections = np.array(Vin_complex).reshape(B, values_per_section)
Vout_sections = np.array(Vout_complex).reshape(B, values_per_section)
Iin_sections = np.array(Iin_complex).reshape(B, values_per_section)
Iout_sections = np.array(Iout_complex).reshape(B, values_per_section)

# Find the index of the desired frequency
index = np.where(Freq == freq_interest)
if len(index[0]) == 0:
    raise ValueError(f"Frequency {freq_interest} not found in the data.")
index = index[0][0]

# Extract values at the chosen frequency
Vin_values = Vin_sections[:, index]
Vout_values = Vout_sections[:, index]
Iin_values = Iin_sections[:, index]
Iout_values = Iout_sections[:, index]

Pout_values = np.real(Vout_values * np.conj(Iout_values))
Pin_values = np.real(Vin_values * np.conj(Iin_values))

# Convert power to dBm
Pout_dbm = 10 * np.log10(Pout_values * 1000)
Pin_dbm = 10 * np.log10(Pin_values * 1000)

# Find the indices for -40 dBm and -10 dBm input power
target_low = -40
target_high = -10

index_low = np.argmin(np.abs(Pin_dbm - target_low))
index_high = np.argmin(np.abs(Pin_dbm - target_high))

# Calculate linear gain approximation
slope = (Pout_dbm[index_low] - Pout_dbm[index_high]) / (Pin_dbm[index_low] - Pin_dbm[index_high])
intercept = Pout_dbm[index_low] - slope * Pin_dbm[index_low]

Pin_linear = np.linspace(Pin_dbm[index_low], Pin_dbm[-1], len(Pout_dbm))
Pout_linear = slope * Pin_linear + intercept


ylim = None
if len(sys.argv) >= 11:
    ylim = [float(sys.argv[10]), float(sys.argv[11])]

# Create 'figs' folder if it doesn't exist
if not os.path.exists('figs'):
    os.makedirs('figs')

# Save the plots inside the 'figs' folder
plt.figure()
plt.plot(Pin_dbm, Pout_dbm, label='Measured Po/Pi')
plt.plot(Pin_linear, Pout_linear, label='Linear Gain', color='black', linestyle=':')
plt.xlabel("Input Power (dBm)")
plt.ylabel("Output Power (dBm)")
plt.title(f"Output Power vs Input Power at {freq_interest/1e9} GHz")
plt.grid()
plt.legend(loc='upper left', fontsize=7)

# Automatically set xlim if not provided
if xlim is None:
    xlim = [min(Pin_dbm), max(Pin_dbm)]

plt.xlim(xlim)

# Automatically set ylim if not provided, using data limits
if ylim is None:
    ylim = [min(Pout_dbm) - 10, max(Pout_dbm) + 10]

plt.ylim(ylim)
plt.savefig("figs/output_power_vs_input_power.png")

# Plot Gain vs. Input Power
Gain_db = Pout_dbm - Pin_dbm
max_gain = Gain_db.max()
max_gain_array = np.full(len(Pin_dbm), max_gain)
max_gain_array_subtract = max_gain_array - Gain_db
max_gain_final = max_gain_array_subtract - 1
P1db_curve = abs(max_gain_final)
P1db_index = np.argmin(P1db_curve)
Po_p1db = P1db_curve[P1db_index]
Pi_p1db = Pin_dbm[P1db_index]
plt.figure()
plt.plot(Pin_dbm, P1db_curve, color='black', linestyle='--')
plt.plot(Pi_p1db, Po_p1db, 'o', label=f'P1 = {Pi_p1db:.2f} dBm', color='black', markersize=2)  # Mark the P1dB point
plt.plot(Pin_dbm, Gain_db, label='Gain')
plt.xlabel("Input Power (dBm)")
plt.ylabel("Gain (dB)")
plt.title(f"Post Layout (core) Av vs IP at {freq_interest/1e9} GHz")
plt.legend(fontsize=6)
plt.grid()

# Automatically set xlim if not provided
plt.xlim(xlim)

# Automatically set ylim if not provided, using data limits
if ylim is None:
    ylim = [min(Gain_db) - 10, max(Gain_db) + 10]

plt.ylim(ylim)
plt.savefig("figs/gain_vs_input_power.png")

print("Plots saved in 'figs' folder as 'output_power_vs_input_power.png' and 'gain_vs_input_power.png'")


