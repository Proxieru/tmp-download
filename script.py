import tkinter as tk

def on_button_click():
    label.config(text="Button Pressed!")

# Create the main window
root = tk.Tk()
root.title("Button Example")

# Create a label
label = tk.Label(root, text="Press the button")
label.pack()

# Create a button that calls `on_button_click` when pressed
button = tk.Button(root, text="Click Me", command=on_button_click)
button.pack()

# Run the Tkinter event loop
root.mainloop()
