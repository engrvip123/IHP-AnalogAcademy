
# Define variables
IVERILOG = iverilog
VVP = vvp
GTKWAVE = gtkwave
NGSPICE = ngspice
OUTPUT = ctrl.out
MIXED = control.so
MIXED_OBJ = control_obj_dir
VCD_FILE = control_tb.vcd
SRC_FILES = control.v spi.v control_tb.v
NGSPICE_FILE = control.v
DEST_DIR = ../../xschem/multiplexer/simulations
# Default target
all: run_wave

# Compile using iverilog
$(OUTPUT): $(SRC_FILES)
	$(IVERILOG) -o $(OUTPUT) $(SRC_FILES)

# Run the simulation with vvp
run: $(OUTPUT)
	$(VVP) $(OUTPUT)

copy: 
	cp $(MIXED) $(DEST_DIR)

# Open the wave file in GTKWave
wave: $(VCD_FILE)
	$(GTKWAVE) $(VCD_FILE) conf.gtkw

# Run ngspice vlnggen command
ngspice:
	$(NGSPICE) vlnggen $(NGSPICE_FILE)

# Execute both the simulation and wave viewer
run_wave: run wave

# Run ngspice and then the rest of the steps
full: ngspice run_wave copy

# Clean up generated files
clean:
	rm -f $(OUTPUT) $(VCD_FILE) $(MIXED)
	rm -rf $(MIXED_OBJ) 
