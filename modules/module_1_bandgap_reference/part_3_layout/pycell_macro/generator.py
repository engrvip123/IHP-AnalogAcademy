"""Module to automatically generate a gallery of devices out of spice netlist creating a new GDS file. Can be used in
Klayout's batch mode. For example:
klayout -n sg13g2 -zz -r generator.py -rd netlist=netlist.spice -rd output=macros/gallery.gds

"""
import pathlib
import sys
import re
import argparse
from typing import List, Dict
import pya
import klayout.db

LIB = 'SG13_dev'

def parse_netlist(netlist: str) -> List[Dict[str, str]]:
    # Define regular expression patterns for each component type
    patterns = {
        'ipin': re.compile(r"^\*\.ipin\s+(\S+)\s*$", re.MULTILINE),
        'opin': re.compile(r"^\*\.opin\s+(\S+)\s*$", re.MULTILINE),
        'iopin': re.compile(r"^\*\.iopin\s+(\S+)\s*$", re.MULTILINE),
        'bjt': re.compile(r"^XQ(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+Nx=([\d\.]+)(?:\s+le=([\d\.e-]+))?\s*$", re.MULTILINE),
        'capacitor': re.compile(r"^XC(\S+)\s+\S+\s+\S+\s+(\S+)\s+w=([\d\.e-]+)\s+l=([\d\.e-]+)\s+m=([\d\.]+)\s*$", re.MULTILINE),
        'diode': re.compile(r"^XD(\S+)\s+\S+\s+\S+\s+(\S+)\s+l=([\d\.a-zA-Z]+)\s+w=([\d\.a-zA-Z]+)\s*$", re.MULTILINE),
        'resistor': re.compile(r"^XR(\S+)\s+\S+\s+\S+\s+(\S+)\s+w=([\d\.e-]+)\s+l=([\d\.e-]+)\s+m=([\d\.]+)\s+b=([\d\.]+)\s*$", re.MULTILINE),
        'mosfet': re.compile(r"^XM(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+w=([\d\.u-]+)\s+l=([\d\.u-]+)\s+ng=([\d\.]+)\s+m=([\d\.]+)(?:\s+rfmode=([\d\.]+))?\s*$", re.MULTILINE),
        'tap': re.compile(r"^XR(\S+)\s+\S+\s+\S+\s+(\S+)\s*$", re.MULTILINE)
    }

    components = []

    # Parse pins
    for pin_type in ['ipin', 'opin', 'iopin']:
        for match in patterns[pin_type].finditer(netlist):
            components.append({
                'name': match.group(1),
                'model': pin_type
            })

    # Parse BJTs
    for match in patterns['bjt'].finditer(netlist):
        components.append({
            'name': f"XQ{match.group(1)}",
            'model': match.group(2),
            'Nx': match.group(3),
            'le': match.group(4) if match.group(4) else None
        })

    # Parse capacitors
    for match in patterns['capacitor'].finditer(netlist):
        components.append({
            'name': f"XC{match.group(1)}",
            'model': match.group(2),
            'w': match.group(3),
            'l': match.group(4),
            'm': match.group(5)
        })

    # Parse diodes
    for match in patterns['diode'].finditer(netlist):
        components.append({
            'name': f"XD{match.group(1)}",
            'model': match.group(2),
            'l': match.group(3),
            'w': match.group(4)
        })

    # Parse resistors
    for match in patterns['resistor'].finditer(netlist):
        components.append({
            'name': f"XR{match.group(1)}",
            'model': match.group(2),
            'w': match.group(3),
            'l': match.group(4),
            'm': match.group(5),
            'b': match.group(6)
        })

    # Parse MOSFETs
    for match in patterns['mosfet'].finditer(netlist):
        components.append({
            'name': f"XM{match.group(1)}",
            'model': match.group(2),
            'w': match.group(3),
            'l': match.group(4),
            'ng': match.group(5),
            'm': match.group(6),
            'rfmode': match.group(7) if match.group(7) else None
        })
    
    #Parse ntap
    for match in patterns['tap'].finditer(netlist):
        components.append({
            'name': f"XR{match.group(1)}",
            'model': match.group(2)  # In this case, group 4 is the ntap model
        })

    return components


def generate_devices(netlist: str, output: str):
    
    components = parse_netlist(netlist)
    lib = pya.Library.library_by_name(LIB)

    layout = klayout.db.Layout(True)
    layout.dbu = 0.001
    top_cell = layout.cell(layout.add_cell('gallery'))
    
    res = find_instances_by_model(components, 'rppd')
    
    xstep = 0
    cell_w = 0 
    y_offset = 100
    hmax = 0
    for item in res:
        width = float(item['w'])*1e6
        length = float(item['l'])*1e6
        bends = int(item['b'])
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('rppd')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u', 'b' : f'{bends}'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep,y_offset ))))
            cell_w = bbox.width()
            cell_h = bbox.height()
            if cell_h > hmax:
                hmax = cell_h
    #         print(f'w: {cell_w}, h: {cell_h}, xstep: {xstep}')
    
    
    res = find_instances_by_model(components, 'rhigh')
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    for item in res:
        width = float(item['w'])*1e6
        length = float(item['l'])*1e6
        bends = int(item['b'])
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('rhigh')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u', 'b' : f'{bends}'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
            cell_w=bbox.width()
            cell_h=bbox.height()
            if cell_h > hmax:
                hmax = cell_h
    
    res = find_instances_by_model(components, 'rsil')
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    for item in res:
        width = float(item['w'])*1e6
        length = float(item['l'])*1e6
        bends = int(item['b'])
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('rsil')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u', 'b' : f'{bends}'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep,y_offset))))
            cell_w=bbox.width()
            cell_h=bbox.height()
            if cell_h > hmax:
                hmax = cell_h
    

    mos = find_instances_by_model(components, 'sg13_lv_nmos')    
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    for item in mos:
        width = float(item['w'][:-1])
        length = float(item['l'][:-1])
        ng = int(item['ng'])
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('nmos')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u', 'ng' : f'{ng}'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
            cell_w=bbox.width()
            cell_h=bbox.height()
            if cell_h > hmax:
                hmax = cell_h
    

    
    mos = find_instances_by_model(components, 'sg13_hv_nmos')    
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    
    for item in mos:
        width = float(item['w'][:-1])
        length = float(item['l'][:-1])
        ng = int(item['ng'])
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('nmosHV')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u', 'ng' : f'{ng}'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
            cell_w=bbox.width()
            cell_h=bbox.height()
            if cell_h > hmax:
                hmax = cell_h
    
    mos = find_instances_by_model(components, 'sg13_lv_pmos')    
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    for item in mos:
        name = item['name']
        width = float(item['w'][:-1])
        length = float(item['l'][:-1])
        ng = int(item['ng'])
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('pmos')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u', 'ng' : f'{ng}'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
            cell_w=bbox.width()
            cell_h=bbox.height()
            if cell_h > hmax:
                hmax = cell_h
    
    mos = find_instances_by_model(components, 'sg13_hv_pmos')    
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    for item in mos:
        name = item['name']
        width = float(item['w'][:-1])
        length = float(item['l'][:-1])
        ng = int(item['ng'])
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('pmosHV')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u', 'ng' : f'{ng}'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
            cell_w=bbox.width()
            cell_h=bbox.height()
            if cell_h > hmax:
                hmax = cell_h
    
    cmim = find_instances_by_model(components, 'cap_cmim')    
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    
    for item in cmim:
        width = float(item['w'])*1e6
        length = float(item['l'])*1e6
        m = int(item['m'])
        for i in range(1,m+1):
            pcell_decl = lib.layout().pcell_declaration('cmim')
            params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
            pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u'})
            cell=layout.cell(pcell)
            bbox=cell.bbox()
            xstep = xstep + 100 + cell_w
            top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
            cell_w=bbox.width()
            cell_h=bbox.height()
            if cell_h > hmax:
                hmax = cell_h

    dant = find_instances_by_model(components, 'dantenna')    
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    for item in dant:
        name = item['name']
        model = item['model']
        width = float(item['w'][:-1])
        length = float(item['l'][:-1])
        pcell_decl = lib.layout().pcell_declaration('dantenna')
        params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
        pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u'})
        cell=layout.cell(pcell)
        bbox=cell.bbox()
        xstep = xstep + 100 + cell_w
        top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
        cell_w=bbox.width()
        cell_h=bbox.height()
        if cell_h > hmax:
            hmax = cell_h
    
    dant = find_instances_by_model(components, 'dpantenna')    
    xstep = 0
    cell_w = 0
    y_offset = y_offset + hmax
    hmax = 0
    for item in dant:
        name = item['name']
        model = item['model']
        width = float(item['w'][:-1])
        length = float(item['l'][:-1])
        pcell_decl = lib.layout().pcell_declaration('dpantenna')
        params = pcell_decl.params_as_hash(pcell_decl.get_parameters())
        pcell = layout.add_pcell_variant(lib, pcell_decl.id(), {'w': f'{width}u', 'l': f'{length}u'})
        cell=layout.cell(pcell)
        bbox=cell.bbox()
        xstep = xstep + 100 + cell_w
        top_cell.insert(klayout.db.CellInstArray(pcell, klayout.db.Trans(klayout.db.Point(xstep, y_offset))))
        cell_w=bbox.width()
        cell_h=bbox.height()
        if cell_h > hmax:
            hmax = cell_h
    

    pathlib.Path(output).parent.mkdir(parents=True, exist_ok=True)
    layout.write(output)


def find_instances_by_model(components, model_name):
    return [item for item in components if item['model'] == model_name]

try:
    netlist
except NameError:
    print("Missing netlist argument. Please define '-rd netlsit=<path-to-netlist>'")
    sys.exit(1)
#     sys.exit(1)
try:
    output
except NameError:
    print("Missing output argument. Please define '-rd output=<path-to-sealring>'")
    sys.exit(1)


def main():
    
    with open(netlist, 'r') as file:
        netlist_content = file.read()
    
    generate_devices(netlist_content, output) # pylint: disable=undefined-variable
    print(f'GDS created, open it using: ->klayout {output}')

if __name__ == "__main__":
    main()


