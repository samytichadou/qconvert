import os

import config_functions

# get new filepath
def get_new_filepath(filepath, preset_dataset):
    filepath_dir = os.path.dirname(filepath)
    filename = os.path.basename(filepath)

    # format pref suf
    if preset_dataset['prefix'] in {"", " "} and preset_dataset['suffix'] in {"", " "}:
        prefix = ""
        suffix = "_qconvert"
    else:
        if preset_dataset['prefix'] not in {"", " "} and not preset_dataset['prefix'].endswith("_"):
            prefix = preset_dataset['prefix'] + "_"
        else:
            prefix = preset_dataset['prefix']
        if preset_dataset['suffix'] != "" and not preset_dataset['suffix'].startswith("_"):
            suffix = "_" + preset_dataset['suffix']
        else:
            suffix = preset_dataset['suffix']
    # format ext
    if preset_dataset['extension'] in {"", " "}:
        extension = config_functions.get_default_extension()
    else:
        extension = preset_dataset['extension']
    if not extension.startswith("."):
        extension = "." + extension

    new_filename = prefix + os.path.splitext(filename)[0] + suffix + extension
    
    return os.path.join(filepath_dir, new_filename)

# replace command
def replace_command(command, filepath, new_filepath):
    new_command = command.replace("input", '"'+filepath+'"').replace("output", '"'+new_filepath+'"').replace("ffmpeg_path", '"'+config_functions.get_ffmpeg_path()+'"')
    return new_command