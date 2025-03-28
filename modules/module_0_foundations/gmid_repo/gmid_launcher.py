from mosplot import LookupTableGenerator
from mosplot.src.manu_man import description_menu, sweeping_menu, input_selection, transistor_menu
import os

def main():
    pdk_type = input_selection()
    model, transistor_model = transistor_menu()  # model is a dictionary
    description, simulator, model_path = description_menu(model)
    vsb, vgs, vds, width, lengths = sweeping_menu()
    
    # Create the LookupTableGenerator object with all parameters
    obj = LookupTableGenerator(
    	simdisc=transistor_model,
        description=description,
        simulator=simulator,
        model_paths=model_path,
        model_names=model,  # Directly use the model dictionary
        vsb=vsb,
        vgs=vgs,
        vds=vds,
        width=width,
        lengths=lengths,
    )
    


    file_name = f"{description}" 
    file_path = os.path.join('LUTs', file_name)  


    os.makedirs('LUTs', exist_ok=True)

    obj.build(file_path)


if __name__ == "__main__":
    main()

