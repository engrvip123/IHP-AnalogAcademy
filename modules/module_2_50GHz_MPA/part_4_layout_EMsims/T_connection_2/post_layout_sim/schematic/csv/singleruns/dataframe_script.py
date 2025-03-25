import pandas as pd
import glob
import os

# Base directory for the CSV files
csv_path = '/home/pedersen/projects/IHP-AnalogAcademy/modules/module_2_50GHz_MPA/part_4_layout_EMsims/T_connection_2/post_layout_sim/schematic/csv/singleruns/'

# Define the parameter types and the columns they provide
file_types = {
    "Vout": ["r xyce/V(VOUT)", "i xyce/V(VOUT)"],
    "Vin":  ["r xyce/V(VIN)",  "i xyce/V(VIN)"],
    "IPR3": ["r xyce/I(PR3)", "i xyce/I(PR3)"],
    "IPR2": ["r xyce/I(PR2)", "i xyce/I(PR2)"]
}

# Frequency of interest: 50 GHz (5e+10)
freq_value = 5e+10

# Dictionary to collect data by power level.
# Keys will be the power level string (e.g., "-30") and values are dictionaries of parameter values.
results = {}

# Process each parameter type separately
for key, cols in file_types.items():
    # Pattern for files of this type, e.g., "Vout_*dbm.csv"
    pattern = os.path.join(csv_path, f"{key}_*dbm.csv")
    files = glob.glob(pattern)
    
    for file in files:
        try:
            # Extract the power level from the filename.
            # E.g., if filename is "Vout_-30dbm.csv", split on '_' and then remove "dbm.csv"
            base = os.path.basename(file)
            # base might be "Vout_-30dbm.csv"
            parts = base.split('_')  # ["Vout", "-30dbm.csv"]
            if len(parts) < 2:
                continue
            power_str = parts[1].replace("dbm.csv", "")  # e.g. "-30"
            
            # Read the CSV file (with semicolon as delimiter)
            df = pd.read_csv(file, sep=';', comment=';', engine='python')
            
            # Filter the row at 50 GHz
            row_50 = df[df['FREQ'] == freq_value]
            if row_50.empty:
                print(f"No 50 GHz data in {file}")
                continue
            
            # Get the first (and only) row's data for each expected column from this file type
            for col in cols:
                # Initialize the dictionary for this power level if needed.
                if power_str not in results:
                    results[power_str] = {}
                # Use .iloc[0] to grab the value
                results[power_str][col] = row_50[col].iloc[0]
                
        except Exception as e:
            print(f"Failed to process {file}: {e}")

# Define final column order (always include the Power Level as first column)
final_columns = ['Power Level', 
                 'r xyce/V(VOUT)', 'i xyce/V(VOUT)',
                 'r xyce/V(VIN)', 'i xyce/V(VIN)',
                 'r xyce/I(PR3)', 'i xyce/I(PR3)',
                 'r xyce/I(PR2)', 'i xyce/I(PR2)']

# Build rows for the final DataFrame; sort power levels numerically if possible
rows = []
# Convert keys to float if possible for sorting
sorted_power_levels = sorted(results.keys(), key=lambda x: float(x))
for power in sorted_power_levels:
    row = {"Power Level": power}
    # For each expected column, set the value or None if missing
    for col in final_columns[1:]:
        row[col] = results[power].get(col, None)
    rows.append(row)

final_df = pd.DataFrame(rows, columns=final_columns)
final_df.to_csv('final_csv/final_50GHz_data.csv', index=False)

print("Final DataFrame with 50 GHz data for all CSV files:")
print(final_df)

