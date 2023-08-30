import sys

sys.path.append('..')
import write_package_exports_to_file

sys.path.append('..')

# Example usage
root_folder = 'lib/src'  # Replace with the actual root folder path
sub_folders = ['foundation', 'widgets']
output_file = 'lib/awe_widgets.dart'  # Name of the output file

write_package_exports_to_file.write_file_names(
    root_folder,
    sub_folders,
    output_file,
    "awe_widgets",
    []
)
