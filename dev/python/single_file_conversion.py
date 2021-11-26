#!/usr/bin/env python3

import subprocess
import sys

import json_functions
import file_functions

# arg1=filepath, arg2=json preset, arg3=suffix

filepath = sys.argv[1]
preset_dataset = json_functions.read_json(sys.argv[2])
suffix = sys.argv[3]
extension = preset_dataset['extension']
origin_command = preset_dataset['command']
new_filepath = file_functions.get_new_filepath(filepath, suffix, extension)

command = origin_command.replace ("input", '"'+filepath+'"').replace("output", '"'+new_filepath+'"')

print("Launching command : %s" % command)
process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
process.wait()

print()
print("Encoding finished : %s" % new_filepath)