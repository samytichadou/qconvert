import json

# read json
def read_json(filepath):
    print("Reading json : %s" % filepath)
    with open(filepath, "r") as read_file:
        dataset = json.load(read_file)
    return dataset

# create json file
def create_json_file(datas, path) :
    with open(path, "w") as write_file :
        json.dump(datas, write_file, indent=4, sort_keys=False)
