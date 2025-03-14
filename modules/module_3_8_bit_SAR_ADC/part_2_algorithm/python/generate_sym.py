import re
import sys
import os

def parse_verilog(verilog_file):
    """Extract module name, inputs, and outputs from a Verilog file while expanding bus signals."""
    with open(verilog_file, "r") as f:
        code = f.read()

    module_match = re.search(r"module\s+(\w+)\s*\(", code)
    if not module_match:
        raise ValueError("No module found in the Verilog file.")
    module_name = module_match.group(1)

    # Remove comments
    code = re.sub(r"//.*", "", code)

    # Adjusted regex to capture bus definitions properly
    ports = re.findall(r"(input|output)\s*(?:wire|reg)?\s*(\[\d+:\d+\])?\s*(\w+)", code)

    inputs = []
    outputs = []
    for direction, bus, name in ports:
        if bus:
            # Extract bus range
            msb, lsb = map(int, re.findall(r"\d+", bus))
            indices = range(msb, lsb - 1, -1) if msb >= lsb else range(msb, lsb + 1)
            expanded_names = [f"{name}_{i}" for i in indices]
        else:
            expanded_names = [name]

        if direction == "input":
            inputs.extend(expanded_names)
        else:
            outputs.extend(expanded_names)
    
    return module_name, inputs, outputs

def generate_xschem_symbol(verilog_file, output_sym):
    """Generate an Xschem symbol (.sym) for the given Verilog module with expanded bus signals."""
    module_name, inputs, outputs = parse_verilog(verilog_file)
    symbol = [
        f'G {{}}',
        f'K {{type=delay',
        f'verilog_ignore=true',
        f'vhdl_ignore=true',
	f'format="@name [ {" ".join(f"@@{{{p}}}" for p in inputs)} ] [ {" ".join(f"@@{{{p}}}" for p in outputs)} ] null @dut"',
        f'.model @dut @d_cosim_model simulation=@model',
        f'template="name=adut',
        f'dut=dut',
        f'd_cosim_model=d_cosim',
        f'model=./{os.path.basename(verilog_file)[:-2]}.so" }}',
        f'V {{}}', f'S {{}}', f'E {{}}'
    ]

    pin_distance, width, offset_factor = 20, 100, 30
    total_pins = len(inputs) + len(outputs)
    height_input_side = len(inputs) * pin_distance
    height_output_side = len(outputs) * pin_distance
    total_height = max(height_input_side, height_output_side)
    start_y_input = -height_input_side // 2 + pin_distance // 2
    start_y_output = -height_output_side // 2 + pin_distance // 2

    for i, pin_name in enumerate(inputs):
        y = start_y_input + pin_distance * i
        symbol.append(f"B 5 -{width//2 + 2.5 + offset_factor} {y-2.5} -{width//2 - 2.5 + offset_factor} {y+2.5} {{name={pin_name} dir=in verilog_type=wire}}")
        symbol.append(f"T {{{pin_name}}} -90 {y-2.5} 0 1 0.12 0.12 {{}}")
        symbol.append(f"L 4 -{width // 2 + offset_factor} {y} -{width // 2} {y} {{}}")
    
    for i, pin_name in enumerate(outputs):
        y = start_y_output + pin_distance * i
        symbol.append(f"B 5 {width//2 - 2.5 + offset_factor} {y-2.5} {width//2 + 2.5 + offset_factor} {y+2.5} {{name={pin_name} dir=out verilog_type=wire}}")
        symbol.append(f"T {{{pin_name}}} 90 {y-2.5} 0 0 0.12 0.12 {{}}")
        symbol.append(f"L 4 {width // 2 + offset_factor} {y} {width // 2} {y} {{}}")
    
    symbol.append(f'L 4 {width//2} -{total_height//2} {width//2} {total_height//2} {{}}')
    symbol.append(f'L 4 -{width//2} -{total_height//2} -{width//2} {total_height//2} {{}}')
    symbol.append(f'L 4 -{width//2} {total_height//2} {width//2} {total_height//2} {{}}')
    symbol.append(f'L 4 -{width//2} -{total_height//2} {width//2} -{total_height//2} {{}}')
    symbol.append(f'T {{{module_name}}} 0 {total_height//2 + 5} 0 0 0.12 0.12 {{}}')

    with open(output_sym, "w") as f:
        f.write("\n".join(symbol))
    print(f"Xschem symbol written to {output_sym}")

def main():
    """Main function to process Verilog and generate the symbol."""
    if len(sys.argv) != 3:
        print("\nUsage: python generate_sym.py <verilog_file> <symbol_file>")
        print("Example: python generate_sym.py control.v test.sym\n")
        sys.exit(1)

    verilog_file, sym_file = sys.argv[1:3]
    try:
        module_name, inputs, outputs = parse_verilog(verilog_file)
        print(f"Parsed module: {module_name}\nInputs: {inputs}\nOutputs: {outputs}")
        generate_xschem_symbol(verilog_file, sym_file)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

