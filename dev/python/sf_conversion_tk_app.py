from tkinter import *
import tkinter as tk
from tkinter import ttk
from tkinter.messagebox import showinfo

import os
import global_variables

class QConvertSFConversion(Tk):
    def __init__(self, root):
        page = Frame(root)
        page.grid()

        # progressbar
        pb = ttk.Progressbar(
            page,
            orient='horizontal',
            mode='determinate',
            length=280
        )
        # place the progressbar
        pb.grid(column=0, row=0, columnspan=2, padx=10, pady=20)

        # label
        value_label = ttk.Label(page, text=self.update_progress_label(pb))
        value_label.grid(column=0, row=1, columnspan=2)

        # start button
        start_button = ttk.Button(
            page,
            text='Progress',
            command=lambda:self.progress(pb, value_label)
        )
        start_button.grid(column=0, row=2, padx=10, pady=10, sticky=tk.E)

        stop_button = ttk.Button(
            page,
            text='Stop',
            command=lambda:self.stop(pb, value_label)
        )
        stop_button.grid(column=1, row=2, padx=10, pady=10, sticky=tk.W)

    def update_progress_label(self, pb):
        #return "test"
        return f"Current Progress: {pb['value']}%"

    def progress(self, pb, value_label):
        if pb['value'] != 100:
            pb['value'] += 20
            value_label['text'] = self.update_progress_label(pb)
        else:
            showinfo(message='The progress completed!')

    def stop(self, pb, value_label):
        pb.stop()
        value_label['text'] = self.update_progress_label(pb)

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
root.title('Conversion')

myapp = QConvertSFConversion(root)
root.mainloop()