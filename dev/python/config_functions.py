import global_variables
import json_functions

def get_ffmpeg_path():
    config_dataset = json_functions.read_json(global_variables.qc_config_filepath)
    if config_dataset['ffmpeg_executable'] != "":
        print(config_dataset['ffmpeg_executable'])
        return config_dataset['ffmpeg_executable']
    else:
        return ""

def set_ffmpeg_path(filepath):
    config_file = global_variables.qc_config_filepath
    config_dataset = json_functions.read_json(config_file)
    config_dataset['ffmpeg_executable'] = filepath
    json_functions.create_json_file(config_dataset, config_file)
    return True