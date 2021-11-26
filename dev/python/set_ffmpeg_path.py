#!/usr/bin/env python3

from tkinter import *
from tkinter.filedialog import askopenfilename

import config_functions

class QConvertSetFFMPEG:
    def __init__(self, parent):
        self.myParent = parent  ### (7) remember my parent, the root
        self.myParent.title('QConvert - Set FFMPEG Path')
        self.myParent.geometry("300x100")
        self.myContainer1 = Frame(parent)
        self.myContainer1.grid()

        # browse ffmpeg
        self.var_path = StringVar(value=config_functions.get_ffmpeg_path())

        self.path_ent = Entry(self.myContainer1, textvariable = self.var_path)
        self.path_ent.grid(row=0, column=0)

        self.browse_but = Button(self.myContainer1)
        self.browse_but.configure(text="Browse")
        self.browse_but.grid(row=0, column=1)
        self.browse_but.bind("<Button-1>", self.browse_but_click)

        self.quit_but = Button(self.myContainer1)
        self.quit_but.configure(text="Quit")
        self.quit_but.grid(row=1, column=0)
        self.quit_but.bind("<Button-1>", self.quit_but_click)

        self.set_but = Button(self.myContainer1)
        self.set_but.configure(text="Set")
        self.set_but.grid(row=1, column=1)
        self.set_but.bind("<Button-1>", self.set_but_click)

    def browse_but_click(self, event):    ### (3)
        filepath = askopenfilename(filetypes=(("Windows Executable","*.exe"),("All files","*.*")))
        self.path_ent.insert(END, filepath)

    def set_but_click(self, event):
        config_functions.set_ffmpeg_path(self.var_path.get())

    def quit_but_click(self, event):
        self.myParent.destroy()

root = Tk()
myapp = QConvertSetFFMPEG(root)
root.mainloop()