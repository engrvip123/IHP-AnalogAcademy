from pick import pick

def description_menu(model):
    Options_1 = ["Corner lib typical", "Corner lib fast", "Corner lib slow", "Exit"]
    title_1 = "Please choose the corner lib: "
    discription = input("Please enter a discription: ")
    simulator = "ngspice"
    _, index = pick(Options_1, title_1)
    if index == 0:
        print("You have chosen Corner lib typical")
        print(model)
        if any('lv' in value for value in model.values()):
       	    model_path = ["cornerMOSlv.lib mos_tt",]
       	else:
       	    model_path = ["cornerMOShv.lib mos_tt",]
    elif index == 1:
        print("You have chosen Corner lib fast")
        if any('lv' in value for value in model.values()):
            model_path = ["cornerMOSlv.lib mos_ff",]
        else:
            model_path = ["cornerMOShv.lib mos_ff",]
    elif index == 2:
        print("You have chosen Corner lib slow")
        if any('lv' in value for value in model.values()):
            model_path = ["cornerMOSlv.lib mos_ss",]
        else:
            model_path = ["cornerMOShv.lib mos_ss",]
    elif index == 3:
        print("You have chosen to exit")
        exit()
    
    return discription, simulator, model_path

def sweeping_menu():
    def get_floats(prompt):
        while True:
            user_input = input(prompt)
            if user_input.lower() == 'exit':
                return 'exit'
            try:
                return tuple(map(float, user_input.split(',')))
            except ValueError:
                print("Invalid input format. Please enter three numbers separated by commas (e.g., 0, 1, 0.01).")

    # Prompt for VSB
    while True:
        vsb = get_floats("Enter VSB (start, stop, step) or type 'exit' to quit: ")
        if vsb == 'exit':
            return 'Exited'
        elif len(vsb) == 3:
            break

    # Prompt for VGS
    while True:
        vgs = get_floats("Enter VGS (start, stop, step) or type 'exit' to quit: ")
        if vgs == 'exit':
            return 'Exited'
        elif len(vgs) == 3:
            break

    # Prompt for VDS
    while True:
        vds = get_floats("Enter VDS (start, stop, step) or type 'exit' to quit: ")
        if vds == 'exit':
            return 'Exited'
        elif len(vds) == 3:
            break

    # Prompt for width
    while True:
        width_input = input("Enter width value (e.g., 10e-6) or type 'exit' to quit: ")
        if width_input.lower() == 'exit':
            return 'Exited'
        try:
            width = float(width_input)
            break
        except ValueError:
            print("Invalid width input. Please enter a valid number (e.g., 10e-6).")

    # Prompt for lengths or auto-generate
    while True:
        lengths_input = input("Enter lengths (comma-separated, e.g., 500e-9, 600e-9), or type 'auto' for auto-generation: ")
        if lengths_input.lower() == 'exit':
            return 'Exited'
        elif lengths_input.lower() == 'auto':
            try:
                start = float(input("Enter start value for lengths: "))
                increment = float(input("Enter increment value: "))
                count = int(input("Enter number of increments: "))
                lengths = [start + i * increment for i in range(count)]
                break
            except ValueError:
                print("Invalid input for auto-generation. Try again.")
        else:
            try:
                lengths = [float(i) for i in lengths_input.split(',')]
                break
            except ValueError:
                print("Invalid lengths input. Please enter comma-separated numbers.")

    return vsb, vgs, vds, width, lengths




def input_selection(): 
    # Simply return "ihp_open_pdk" without asking for input
    return "ihp_open_pdk"



def transistor_menu():
    Options = ["NMOS_LV", "PMOS_LV", "NMOS_HV", "PMOS_HV", "Exit"]
    title = "Please choose the transistor model: "
    option, index = pick(Options, title)

    if index == 0:
        print("You have chosen NMOS_LV")
        model = {"nmos": "sg13_lv_nmos"}
        simulation_description = "*n.xm1.nsg13_lv_nmos"
        return model, simulation_description
    elif index == 1:
        print("You have chosen PMOS_LV")
        model = {"pmos": "sg13_lv_pmos"}
        simulation_description = "*n.xm1.nsg13_lv_pmos"
        return model, simulation_description
    elif index == 2:
        print("You have chosen NMOS_HV")
        model = {"nmos": "sg13_hv_nmos"}
        simulation_description = "*n.xm1.nsg13_hv_nmos"
        return model, simulation_description
    elif index == 3:
        print("You have chosen PMOS_HV")
        model = {"pmos": "sg13_hv_pmos"}
        simulation_description = "*n.xm1.nsg13_hv_pmos"
        return model, simulation_description
    elif index == 4:
        print("You have chosen to exit")
        exit()
        return model, simulation_description
