import json
import os
import global_variables

# read json
def read_json(filepath):
    print("Reading json : %s" % filepath)
    with open(filepath, "r") as read_file:
        dataset = json.load(read_file)
    return dataset

# create json file
def create_json_file(datas, path):
    with open(path, "w") as write_file :
        json.dump(datas, write_file, indent=4, sort_keys=False)

# create preset
def create_preset(name, command, extension, suffix, prefix):
    dataset = {}
    dataset["command"]      = command
    dataset["extension"]    = extension
    dataset["suffix"]       = suffix
    dataset["prefix"]       = prefix

    json_filepath = os.path.join(global_variables.qc_presets_dir, "%s.json" % name)
    create_json_file(dataset, json_filepath)
    
    return json_filepath
