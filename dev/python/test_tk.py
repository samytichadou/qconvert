import tkinter as tk
my_w = tk.Tk()
my_w.geometry("250x100")  
my_w.title("plus2net.com")  # Adding a title

l1 = tk.Label(my_w,  text='F Name (sticky=\'W\')' ) #added one Label 
l1.grid(row=1,column=1,sticky='W') 

e1 = tk.Entry(my_w,   width=10,bg='yellow') # added one Entry box
e1.grid(row=1,column=2) 

l2 = tk.Label(my_w,  text='L Name (sticky=\'E\')')  # 
l2.grid(row=2,column=1,sticky='E') 

e2 = tk.Entry(my_w,   width=10,bg='yellow') # added one Entry box
e2.grid(row=2,column=2)

l3 = tk.Label(my_w,  text='Add Door No and Street address')   
l3.grid(row=3,column=1,sticky='W') 

e3 = tk.Entry(my_w,   width=10,bg='yellow') # added one Entry box
e3.grid(row=3,column=2)

my_w.mainloop()