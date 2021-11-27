#!/usr/bin/env python3

import subprocess
import sys

import json_functions
import cmd_functions

# args%=files, arg2=json preset, arg3=pattern ("None" if no pattern)

args_len = len(sys.argv) - 1
preset_dataset = json_functions.read_json(sys.argv[args_len-1])
pattern = sys.argv[args_len]

# filter files
file_list = []
for n in range(1,args_len-1):
    filepath = sys.argv[n]
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
print("ENCODING FINISHED : File Selection")