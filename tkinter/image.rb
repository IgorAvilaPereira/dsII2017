require 'tk'

resultsVar = TkVariable.new
root = TkRoot.new
root.title = "Window"

image = TkPhotoImage.new
image.file = "dc.png"

label = TkLabel.new(root) 
label.image = image
label.place('height' => image.height, 'width' => image.width, 'x' => 10, 'y' => 10)
Tk.mainloop