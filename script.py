import tkinter as tk
import os

def quit():
    os._exit()

def on_button_click():
    print("e")
    label.config(text="Button Pressed!")


root = tk.Tk()
root.title("Bloatinator")

# Create a label
label = tk.Label(root, text="Press the button")
label.pack()

# Create a button that calls `on_button_click` when pressed
genbutton = tk.Button(root, text="Generate fake files", command=on_button_click)
gencustombutton = tk.Button(root, text="Generate fake files with custome size", command=on_button_click)
genviewbutton = tk.Button(root, text="View generated fake files", command=on_button_click)
gendeletebutton = tk.Button(root, text="Delete all fake files", command=on_button_click)
quitbutton = tk.Button(root, text="Quit", command=quit)

genbutton.pack()
gencustombutton.pack()
genviewbutton.pack()
gendeletebutton.pack()
quitbutton.pack()

# Run the Tkinter event loop
root.mainloop()
