import pandas as pd
from pathlib import Path

from pathlib import Path
import pandas as pd

# Get the absolute path of the script
script_dir = Path(__file__).resolve().parent  # Directory where the script is located
file_path = script_dir / "library_data.xlsx"

# Print the path to debug
print(f"Looking for file at: {file_path}")

# Try loading the Excel file
try:
    xls = pd.ExcelFile(file_path)
except FileNotFoundError:
    print("Error: The file was not found. Please check the file path and ensure the file exists.")


# Export each sheet as a CSV file in the parent folder
for sheet_name in xls.sheet_names:
    df = pd.read_excel(xls, sheet_name=sheet_name)
    output_file = script_dir / f"{sheet_name}.csv"
    df.to_csv(output_file, index=False, encoding="utf-8-sig")  # utf-8-sig to handle Swedish characters

print(f"CSV files have been saved in {script_dir}")
