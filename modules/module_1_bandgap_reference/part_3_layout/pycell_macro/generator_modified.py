"""
Module to automatically generate a gallery of devices out of a SPICE netlist by creating a new GDS file.
Can be used in Klayout's batch mode. For example:
klayout -n sg13g2 -zz -r generator.py -rd netlist=netlist.spice -rd output=macros/gallery.gds
"""

import pathlib
import sys
import re
from typing import List, Dict
import pya
import klayout.db

LIB = 'SG13_dev'

def parse_netlist(netlist: str) -> List[Dict[str, str]]:
    print("[DEBUG] Starting to parse netlist...")
    
    # Define regular expression patterns for each component type
    patterns = {
        'ipin': re.compile(r"^\*\.ipin\s+(\S+)\s*$", re.MULTILINE),
        'opin': re.compile(r"^\*\.opin\s+(\S+)\s*$", re.MULTILINE),
        'iopin': re.compile(r"^\*\.iopin\s+(\S+)\s*$", re.MULTILINE),
        'bjt': re.compile(
            r"^XQ(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+Nx=([\d\.]+)(?:\s+le=([\d\.e-]+))?\s*$",
            re.MULTILINE
        ),
        'capacitor': re.compile(
            r"^XC(\S+)\s+\S+\s+\S+\s+(\S+)\s+w=([\d\.e-]+)\s+l=([\d\.e-]+)\s+m=([\d\.]+)\s*$",
            re.MULTILINE
        ),
        'diode': re.compile(
            r"^XD(\S+)\s+\S+\s+\S+\s+(\S+)\s+l=([\d\.a-zA-Z]+)\s+w=([\d\.a-zA-Z]+)\s*$",
            re.MULTILINE
        ),
        'resistor': re.compile(
            r"^XR(\S+)\s+\S+\s+\S+\s+(\S+)\s+w=([\d\.e-]+)\s+l=([\d\.e-]+)\s+m=([\d\.]+)\s+b=([\d\.]+)\s*$",
            re.MULTILINE
        ),
        'mosfet': re.compile(
            r"^XM(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+w=([\d\.u-]+)\s+l=([\d\.u-]+)\s+ng=([\d\.]+)\s+m=([\d\.]+)(?:\s+rfmode=([\d\.]+))?\s*$",
            re.MULTILINE
        ),
        'tap': re.compile(
            r"^XR(\S+)\s+\S+\s+\S+\s+(\S+)\s*$",
            re.MULTILINE
        )
    }

    components = []

    # Parse each type of component
    for component_type, pattern in patterns.items():
        matches = list(pattern.finditer(netlist))
        print(f"[DEBUG] Found {len(matches)} '{component_type}' components.")
        for match in matches:
            component = {'type': component_type}
            if component_type in ['ipin', 'opin', 'iopin']:
                component['name'] = match.group(1)
                component['model'] = component_type
            elif component_type == 'bjt':
                component['name'] = f"XQ{match.group(1)}"
                component['model'] = match.group(2)
                component['Nx'] = match.group(3)
                component['le'] = match.group(4) if match.group(4) else None
            elif component_type == 'capacitor':
                component['name'] = f"XC{match.group(1)}"
                component['model'] = match.group(2)
                component['w'] = match.group(3)
                component['l'] = match.group(4)
                component['m'] = match.group(5)
            elif component_type == 'diode':
                component['name'] = f"XD{match.group(1)}"
                component['model'] = match.group(2)
                component['l'] = match.group(3)
                component['w'] = match.group(4)
            elif component_type == 'resistor':
                component['name'] = f"XR{match.group(1)}"
                component['model'] = match.group(2)
                component['w'] = match.group(3)
                component['l'] = match.group(4)
                component['m'] = match.group(5)
                component['b'] = match.group(6)
            elif component_type == 'mosfet':
                component['name'] = f"XM{match.group(1)}"
                component['model'] = match.group(2)
                component['w'] = match.group(3)
                component['l'] = match.group(4)
                component['ng'] = match.group(5)
                component['m'] = match.group(6)
                component['rfmode'] = match.group(7) if match.group(7) else None
            elif component_type == 'tap':
                component['name'] = f"XR{match.group(1)}"
                component['model'] = match.group(2)  # Assuming group 2 is the model
            else:
                print(f"[WARNING] Unknown component type: {component_type}")

            components.append(component)
            print(f"[DEBUG] Parsed component: {component}")

    print(f"[DEBUG] Total components parsed: {len(components)}")
    return components

def find_instances_by_model(components: List[Dict[str, str]], model_name: str) -> List[Dict[str, str]]:
    print(f"[DEBUG] Filtering components for model: '{model_name}'")
    filtered = [comp for comp in components if comp.get('model') == model_name]
    print(f"[DEBUG] Found {len(filtered)} instances of model: '{model_name}'")
    return filtered

def generate_devices(netlist: str, output: str):
    print("[DEBUG] Starting device generation...")
    components = parse_netlist(netlist)
    print("[DEBUG] Completed netlist parsing.")

    lib = pya.Library.library_by_name(LIB)
    if lib is None:
        print(f"[ERROR] Library '{LIB}' not found. Please ensure it is loaded in KLayout.")
        sys.exit(1)
    print(f"[DEBUG] Using library: '{LIB}'")

    layout = klayout.db.Layout(True)
    layout.dbu = 0.001
    print(f"[DEBUG] Layout created with dbu={layout.dbu}")

    top_cell = layout.cell(layout.add_cell('gallery'))
    print("[DEBUG] Created top-level cell 'gallery'.")

    # Define the order and models to process
    models_to_process = [
        'rppd', 'rhigh', 'rsil',
        'sg13_lv_nmos', 'sg13_hv_nmos',
        'sg13_lv_pmos', 'sg13_hv_pmos',
        'cap_cmim', 'dantenna', 'dpantenna'
    ]

    # Initialize positioning variables
    xstep = 0
    y_offset = 100  # Starting y offset
    hmax = 0  # Maximum height of the current row

    for model_name in models_to_process:
        print(f"[DEBUG] Processing model: '{model_name}'")
        res = find_instances_by_model(components, model_name)
        if not res:
            print(f"[DEBUG] No instances found for model: '{model_name}'. Skipping.")
            continue

        for item in res:
            print(f"[DEBUG] Processing item: {item}")
            try:
                # Handle different models with varying parameters
                if model_name in ['rppd', 'rhigh', 'rsil']:
                    width = float(item['w']) * 1e6
                    length = float(item['l']) * 1e6
                    bends = int(item['b'])
                    m = int(item['m'])
                    pcell_type = model_name
                    params = {
                        'w': f'{width}u',
                        'l': f'{length}u',
                        'b': f'{bends}'
                    }
                elif model_name in ['sg13_lv_nmos', 'sg13_hv_nmos', 'sg13_lv_pmos', 'sg13_hv_pmos']:
                    width = float(item['w'].rstrip('u'))  # Remove 'u' if present
                    length = float(item['l'].rstrip('u'))
                    ng = int(item['ng'])
                    m = int(item['m'])
                    pcell_type = 'nmos' if 'nmos' in model_name else 'pmos'
                    if 'HV' in model_name:
                        pcell_type += 'HV'
                    params = {
                        'w': f'{width}u',
                        'l': f'{length}u',
                        'ng': f'{ng}'
                    }
                elif model_name in ['cap_cmim']:
                    width = float(item['w']) * 1e6
                    length = float(item['l']) * 1e6
                    m = int(item['m'])
                    pcell_type = model_name
                    params = {
                        'w': f'{width}u',
                        'l': f'{length}u'
                    }
                elif model_name in ['dantenna', 'dpantenna']:
                    width = float(item['w'].rstrip('u'))
                    length = float(item['l'].rstrip('u'))
                    pcell_type = model_name
                    params = {
                        'w': f'{width}u',
                        'l': f'{length}u'
                    }
                else:
                    print(f"[WARNING] Unhandled model type: '{model_name}'. Skipping.")
                    continue

                for i in range(1, m + 1):
                    print(f"[DEBUG] Creating PCell variant for '{pcell_type}' with params: {params}")
                    try:
                        pcell_decl = lib.layout().pcell_declaration(pcell_type)
                        if pcell_decl is None:
                            print(f"[ERROR] PCell declaration for '{pcell_type}' not found in library '{LIB}'.")
                            continue

                        pcell = layout.add_pcell_variant(lib, pcell_decl.id(), params)
                        cell = layout.cell(pcell)
                        bbox = cell.bbox()
                        print(f"[DEBUG] Bounding box for PCell '{pcell_type}': {bbox}")

                        # Positioning logic
                        xstep += 100 + bbox.width()
                        print(f"[DEBUG] Updated xstep: {xstep}")

                        # Insert the PCell into the top cell
                        top_cell.insert(klayout.db.CellInstArray(
                            pcell,
                            klayout.db.Trans(klayout.db.Point(xstep, y_offset))
                        ))
                        print(f"[DEBUG] Inserted '{pcell_type}' PCell at position ({xstep}, {y_offset})")

                        # Update the maximum height for the current row
                        cell_h = bbox.height()
                        if cell_h > hmax:
                            hmax = cell_h
                            print(f"[DEBUG] Updated hmax: {hmax}")

                    except Exception as e:
                        print(f"[ERROR] Exception while creating PCell for '{pcell_type}': {e}")

        # After processing each model, update y_offset for the next row
        y_offset += hmax
        hmax = 0  # Reset for the next row
        xstep = 0  # Reset xstep for the next row
        print(f"[DEBUG] Updated y_offset: {y_offset}")

    # Ensure output directory exists
    try:
        pathlib.Path(output).parent.mkdir(parents=True, exist_ok=True)
        print(f"[DEBUG] Output directory '{pathlib.Path(output).parent}' is ready.")
    except Exception as e:
        print(f"[ERROR] Failed to create output directory: {e}")
        sys.exit(1)

    # Write the layout to the output GDS file
    try:
        layout.write(output)
        print(f"[DEBUG] Layout successfully written to '{output}'.")
    except Exception as e:
        print(f"[ERROR] Failed to write layout to '{output}': {e}")
        sys.exit(1)

def main():
    # Check for required arguments
    try:
        netlist
    except NameError:
        print("Missing netlist argument. Please define '-rd netlist=<path-to-netlist>'")
        sys.exit(1)

    try:
        output
    except NameError:
        print("Missing output argument. Please define '-rd output=<path-to-output-gds>'")
        sys.exit(1)

    print("[DEBUG] Opening netlist file...")
    # Read the netlist content
    try:
        with open(netlist, 'r') as file:
            netlist_content = file.read()
        print(f"[DEBUG] Successfully read netlist file: '{netlist}'")
    except Exception as e:
        print(f"[ERROR] Failed to read netlist file '{netlist}': {e}")
        sys.exit(1)

    # Generate devices and create GDS
    generate_devices(netlist_content, output)
    print(f'[INFO] GDS file created successfully. Open it using: klayout {output}')

if __name__ == "__main__":
    main()

