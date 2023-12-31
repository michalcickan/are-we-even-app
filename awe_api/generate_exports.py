import sys

sys.path.append('..')
import write_package_exports_to_file

sys.path.append('..')

# Example usage
root_folder = 'lib/src'  # Replace with the actual root folder path
subfolders = ['models', 'parameters', 'requests',
              'interfaces']  # Replace with the actual subfolder names
output_file = 'lib/awe_api.dart'  # Name of the output file

write_package_exports_to_file.write_file_names(
    root_folder,
    subfolders,
    output_file,
    "awe_api",
    ["src/awe_api_client.dart"],
)
