import global_variables
import json_functions
import os

from tkinter.messagebox import showinfo

def get_ffmpeg_path():
    config_dataset = json_functions.read_json(global_variables.qc_config_filepath)
    if config_dataset['ffmpeg_executable'] != "":
        return config_dataset['ffmpeg_executable']
    else:
        return ""

def set_ffmpeg_path(filepath):
    config_file = global_variables.qc_config_filepath
    config_dataset = json_functions.read_json(config_file)
    config_dataset['ffmpeg_executable'] = filepath
    json_functions.create_json_file(config_dataset, config_file)

    showinfo(message='FFMPEG path set to : %s' % filepath)

    return True

def get_default_extension():
    config_dataset = json_functions.read_json(global_variables.qc_config_filepath)
    if config_dataset['default_extension'] not in {"", " "}:
        return config_dataset['default_extension']
    else:
        return ".mov"

def open_folder(folderpath):
    os.startfile(folderpath)
    return True