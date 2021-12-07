#!/usr/bin/env python3

from tkinter import *
import os
import webbrowser
import config_functions
import json_functions
import global_variables
from tkinter.filedialog import askopenfilename

class QConvertSettings(Tk):
    def __init__(self, root):
        page = Frame(root)
        page.pack()

        Button(page, text = 'Manage Presets', command=lambda:self.change_page(0)).pack()
        Button(page, text = 'Set FFMPEG Path', command=lambda:self.change_page(1)).pack()
        Button(page, text = 'Open Configuration Folder', command=lambda:config_functions.open_folder(global_variables.qc_dir)).pack()
        Button(page, text = 'About', command=lambda:self.change_page(2)).pack()
        Button(page, text = 'Quit', command = quit).pack()

    def manage_presets_page(self, root):
        page = Frame(root)
        page.pack()

        Label(page, text = 'Manage Presets').pack()
        Button(page, text = 'Create Preset', command=lambda:self.change_page(4)).pack()
        Label(page, text = 'Modify Preset').pack()
        Label(page, text = 'Apply Presets to Right Click Entries').pack()
        Button(page, text = 'Open Preset Folder', command=lambda:config_functions.open_folder(global_variables.qc_presets_dir)).pack()
        Button(page, text = 'Back', command=lambda:self.change_page(3)).pack()

    def create_preset_page(self, root):
        page = Frame(root)

        Label(page, text = 'Create Preset').grid(row=0)
        
        var_name = StringVar(value="new_preset")
        var_command = StringVar(value="ffmpeg_path -i input command output -y")
        var_extension = StringVar(value=".mov")
        var_suffix = StringVar(value="_qconvert")
        var_prefix = StringVar(value="")
        
        Label(page, text = 'Name').grid(row=1, column=0, sticky='w')
        Entry(page, textvariable = var_name).grid(row=1, column=1)
        Label(page, text = 'Command').grid(row=2, column=0, sticky='w')
        Entry(page, textvariable = var_command).grid(row=2, column=1)
        Label(page, text = 'Extension').grid(row=3, column=0, sticky='w')
        Entry(page, textvariable = var_extension).grid(row=3, column=1)
        Label(page, text = 'Suffix').grid(row=4, column=0, sticky='w')
        Entry(page, textvariable = var_suffix).grid(row=4, column=1)
        Label(page, text = 'Prefix').grid(row=5, column=0, sticky='w')
        Entry(page, textvariable = var_prefix).grid(row=5, column=1)

        Label(page, text = '').grid(sticky='w')
        Label(page, text = 'Help :').grid(sticky='w')
        Label(page, text = '"ffmpeg_path" to use specific executable').grid(sticky='w')
        Label(page, text = '"input"/"output" for file in/out').grid(sticky='w')
        Label(page, text = '"-y" at the end to automatically overwrite file').grid(sticky='w')
        
        Button(page, text = 'Back', command=lambda:self.change_page(0)).grid(row=11, column=0)
        Button(page, text = 'Create', command=lambda:json_functions.create_preset(
            var_name.get(),
            var_command.get(),
            var_extension.get(),
            var_suffix.get(),
            var_prefix.get(),
        )).grid(row=11, column=1)

        page.grid()

    def ffmpeg_page(self, root):
        page = Frame(root)
        page.pack()
        Label(page, text = 'Set FFMPEG').pack()

        self.var_path = StringVar(value=config_functions.get_ffmpeg_path())
        self.path_ent = Entry(page, textvariable = self.var_path).pack(expand=True)

        #Button(page, text = 'Browse', command=self.browse).pack()
        Button(page, text = 'Set FFMPEG Path', command=lambda:config_functions.set_ffmpeg_path(self.var_path.get())).pack()
        Button(page, text = 'Back', command=lambda:self.change_page(3)).pack()

    def about_page(self, root):
        page = Frame(root)
        page.pack()
        Label(page, text = 'QConvert').pack()
        Label(page, text = 'version 0.3').pack()
        Button(page, text = 'Github', command=lambda:webbrowser.open("https://github.com/samytichadou/qconvert")).pack()
        Button(page, text = 'Donate', command=lambda:webbrowser.open("https://ko-fi.com/tonton_blender")).pack()
        Button(page, text = 'Back', command=lambda:self.change_page(3)).pack()

    def change_page(self, page_index):
        global root
        for widget in root.winfo_children():
            widget.destroy()
        if page_index == 0:
            self.manage_presets_page(root)
        elif page_index == 1:
            self.ffmpeg_page(root)
        elif page_index == 2:
            self.about_page(root)
        elif page_index == 3:
            self.__init__(root)
        elif page_index == 4:
            self.create_preset_page(root)

    def browse(self):
        filepath = askopenfilename(filetypes=(("Windows Executable","*.exe"),("All files","*.*")))
        self.path_ent.delete(0, END)
        self.path_ent.insert(0, filepath)

    def quit():
        root.destroy()

# tk program
root = Tk()

# icons
qc_icon_photo = PhotoImage(file = os.path.join(global_variables.qc_icons_dir, "qc_icon.png"))

# set and start
root.iconphoto(False, qc_icon_photo)
#root.iconbitmap(os.path.join(global_variables.qc_icons_dir, "qconvert_convert.ico"))
root.minsize(300, 5)
root.resizable(0,0)
root.title('Settings')

myapp = QConvertSettings(root)
root.mainloop()