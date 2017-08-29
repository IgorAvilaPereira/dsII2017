require 'tk'
require 'tkextlib/tile'

root = TkRoot.new
root.title = "Window"
root.height = 200
root.width = 500

n = Tk::Tile::Notebook.new(root)do
   height 110
   place('height' => 100, 'width' => 200, 'x' => 10, 'y' => 10)
end

f1 = TkFrame.new(n)


f2 = TkFrame.new(n)
f3 = TkFrame.new(n)

n.add f1, :text => 'One' #, :state =>'disabled'
n.add f2, :text => 'Two'
n.add f3, :text => 'Three'

btn_OK = TkButton.new(f1) do
   text "OK"
   command (proc {myproc})
   pack("side" => "right",  "padx"=> "5", "pady"=> "5")
end

def myproc
	msgBox = Tk.messageBox(
		'type'    => "ok",  
		'icon'    => "info", 
		'title'   => "This is title",
		'message' => "This is message"
	)
end

Tk.mainloop