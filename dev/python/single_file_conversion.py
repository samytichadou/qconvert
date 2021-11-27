#!/usr/bin/env python3

import subprocess
import sys

import json_functions
import cmd_functions

# arg1=filepath, arg2=json preset path

filepath = sys.argv[1]
preset_dataset = json_functions.read_json(sys.argv[2])
new_filepath = cmd_functions.get_new_filepath(filepath, preset_dataset)
command = cmd_functions.replace_command(preset_dataset['command'], filepath, new_filepath)

print("Launching command : %s" % command)
process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
process.wait()

print()
print("Encoding finished : %s" % new_filepath)