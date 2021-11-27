from tkinter import *

ws = Tk()
ws.title('PythonGuides')
#ws.geometry('400x300')
ws.config(bg='#F2B33D')

frame = Frame(ws, bg='#F2B33D')

Button(frame, text="7").grid(row=0, column=0, sticky='ew')
Button(frame, text="8").grid(row=0, column=1)
Button(frame, text="9").grid(row=0, column=2)

Button(frame, text="4 ").grid(row=1, column=0)
Button(frame, text="5").grid(row=1, column=1, ipadx=10, ipady=10, padx=10, pady=10)
Button(frame, text="6").grid(row=1, column=2)

Button(frame, text="7 ").grid(row=2, column=0)
Button(frame, text="8").grid(row=2, column=1)
Button(frame, text="9").grid(row=2, column=2)

frame.pack(expand=True) 

ws.mainloop()