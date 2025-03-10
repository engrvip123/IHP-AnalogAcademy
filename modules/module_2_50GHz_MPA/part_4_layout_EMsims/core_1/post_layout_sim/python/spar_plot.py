import numpy as np
import matplotlib.pyplot as plt
import sys
import os

def read_s4p(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()

    # Ignore comments and extract data
    data = []
    for line in lines:
        if not line.startswith('!') and not line.startswith('#'):
            data.append([float(x) for x in line.split()])

    data = np.array(data)
    freq = data[:, 0]  # Frequency in Hz
    s_params = data[:, 1:]  # S-parameters (real and imaginary parts)

    # Convert to complex numbers
    s_complex = s_params[:, 0::2] + 1j * s_params[:, 1::2]
    
    return freq, s_complex

def plot_and_save_s_parameters(freq, s_complex, save_folder):
    s_db = 20 * np.log10(np.abs(s_complex))  # Convert to dB
    s_phase = np.angle(s_complex, deg=True)  # Convert to phase in degrees

    # Create the folder if it doesn't exist
    os.makedirs(save_folder, exist_ok=True)

    fig, axes = plt.subplots(4, 4, figsize=(12, 10))  # 4x4 grid
    fig.suptitle("S-Parameters Magnitude (dB)")

    for i in range(4):
        for j in range(4):
            ax = axes[i, j]
            ax.plot(freq / 1e9, s_db[:, i * 4 + j], label=f"S{i+1}{j+1}")
            ax.set_xlabel("Frequency (GHz)")
            ax.set_ylabel("Magnitude (dB)")
            ax.legend()
            ax.grid()

    plt.tight_layout()
    plt.savefig(os.path.join(save_folder, "s_parameters_db.png"))
    plt.show()

    # Phase plot
    fig, axes = plt.subplots(4, 4, figsize=(12, 10))  # 4x4 grid
    fig.suptitle("S-Parameters Phase (Degrees)")

    for i in range(4):
        for j in range(4):
            ax = axes[i, j]
            ax.plot(freq / 1e9, s_phase[:, i * 4 + j], label=f"S{i+1}{j+1}")
            ax.set_xlabel("Frequency (GHz)")
            ax.set_ylabel("Phase (Degrees)")
            ax.legend()
            ax.grid()

    plt.tight_layout()
    plt.savefig(os.path.join(save_folder, "s_parameters_phase.png"))
    plt.show()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 script.py your_file.s4p")
        sys.exit(1)

    filename = sys.argv[1]
    if not os.path.isfile(filename):
        print(f"Error: File '{filename}' not found.")
        sys.exit(1)

    save_folder = os.path.join(os.path.dirname(os.path.abspath(__file__)), "sparam_plots")
    freq, s_complex = read_s4p(filename)
    plot_and_save_s_parameters(freq, s_complex, save_folder)

    print(f"Plots saved in: {save_folder}")

