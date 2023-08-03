import os


def write_file_names(root_folder, subfolders, output_file):
    with open(output_file, 'w') as file:
        file.write("/// Support for doing something awesome.\n")
        file.write("///\n")
        file.write("/// More dartdocs go here.\n")
        file.write("library awe_api;\n")
        file.write("\n")
        file.write("export 'src/awe_api_client.dart';\n")
        file.write("\n")

        for subfolder in subfolders:
            folder_path = os.path.join(root_folder, subfolder)
            for root, dirs, files in os.walk(folder_path):
                for name in files:
                    if not name.endswith('.g.dart'):
                        relative_path = os.path.relpath(root, root_folder)
                        file.write("export 'src/{}/{}';\n".format(relative_path, name))


# Example usage
root_folder = 'lib/src'  # Replace with the actual root folder path
subfolders = ['models', 'parameters', 'requests',
              'interfaces', ]  # Replace with the actual subfolder names
output_file = 'lib/awe_api.dart'  # Name of the output file

write_file_names(root_folder, subfolders, output_file)
