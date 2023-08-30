import os

def write_file_names(root_folder, subfolders, output_file, library_name, additional_file_exports):
    with open(output_file, 'w') as file:
        file.write("/// Support for doing something awesome.\n")
        file.write("///\n")
        file.write("/// More dartdocs go here.\n")
        file.write(f"library {library_name};\n")
        file.write("\n")

        for export in additional_file_exports:
            file.write(f"export '{export}';\n")
        file.write("\n")

        for subfolder in subfolders:
            folder_path = os.path.join(root_folder, subfolder)
            for root, dirs, files in os.walk(folder_path):
                for name in files:
                    if not name.endswith('.g.dart'):
                        relative_path = os.path.relpath(root, root_folder)
                        file.write(f"export 'src/{relative_path}/{name}';\n")
