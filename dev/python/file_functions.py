import os

# get new filepath
def get_new_filepath(filepath, suffix, extension):
    filepath_dir = os.path.dirname(filepath)
    filename = os.path.basename(filepath)
    new_filename = os.path.splitext(filename)[0] + suffix + "." + extension
    new_filepath = os.path.join(filepath_dir, new_filename)
    return new_filepath