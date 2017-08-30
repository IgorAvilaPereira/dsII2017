require "tk"

root = TkRoot.new
root.title = "Window"
list = TkListbox.new(root) do
   width 20
   height 10
   setgrid 1
   selectmode 'single'   
   pack('fill' => 'x')
end

list.insert 0, "yellow", "gray", "green",
  "blue", "red", "black", "white", "cyan",
  "pink", "yellow", "orange", "gray"


btn_OK = TkButton.new(root) do
   text "OK"
   borderwidth 5
   underline 0
   state "normal"
   cursor "watch"
   font TkFont.new('times 20 bold')
   foreground  "red"
   activebackground "blue"
   relief      "groove"
   command (proc {showSelectList(list)})
   pack("side" => "right",  "padx"=> "50", "pady"=> "10")
end

def showSelectList(list)
	msgBox = Tk.messageBox(
   		'type'    => "ok",  
   		'icon'    => "info", 
   		'title'   => "This is title",
   		'message' => "Selecionado: "+list.get(list.curselection())
	)
	#puts list.get(list.curselection())	
end


Tk.mainloop