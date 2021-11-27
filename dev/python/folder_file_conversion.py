#!/usr/bin/env python3

import subprocess
import sys
import os

import json_functions
import cmd_functions

# arg1=folderpath, arg2=json preset, arg3=pattern ("None" if no pattern)

folderpath = sys.argv[1]
preset_dataset = json_functions.read_json(sys.argv[2])
pattern = sys.argv[3]

# filter files
file_list = []
for filename in os.listdir(folderpath):
    filepath = os.path.join(folderpath, filename)
    if cmd_functions.is_file_encodable(filepath, pattern):
        file_list.append(filepath)
    else:
        print("IGNORED : %s" % filepath)

# iterate and transcode
for filepath in file_list:
    new_filepath = cmd_functions.get_new_filepath(filepath, preset_dataset)
    command = cmd_functions.replace_command(preset_dataset['command'], filepath, new_filepath)

    print("LAUNCHING COMMAND : %s" % command)
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
    process.wait()
    print("ENCODED : %s" % new_filepath)
    print()

print()
print("ENCODING FINISHED : %s" % folderpath)