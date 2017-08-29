require 'tk'

top = TkRoot.new {title "Label and Entry Widget"}

# code to add a label widget
lb1 = TkLabel.new(top){
   text 'Hello World'
   background "yellow"
   foreground "blue"
   pack('padx'=>10, 'pady'=>10, 'side'=>'left')
}

# code to add a entry widget
text = TkVariable.new
text.value = "Campo"
e1 = TkEntry.new(top){
   background "red"
   foreground "blue"
   textvariable text
   pack('padx'=>10, 'pady'=>10, 'side'=>'left')
}

list = TkListbox.new(top) do
   width 20
   height 10
   setgrid 1
   selectmode 'single'
   pack('fill' => 'x')
end

list.insert 0, "yellow", "gray", "green",
  "blue", "red", "black", "white", "cyan",
  "pink", "yellow", "orange", "gray"

btn_OK = TkButton.new(top) do
   text "OK"
   # borderwidth 5
   # underline 0
   # state "normal"
   # cursor "watch"
   # font TkFont.new('times 20 bold')
   # foreground  "red"
   # activebackground "blue"
   # relief      "groove"
   command (proc {myproc(list, text)})
   pack("side" => "right",  "padx"=> "50", "pady"=> "10")
end

# jeito 2 - comentando o atributo command
# btn_OK.bind("ButtonPress") { 
# 	msgBox = Tk.messageBox(
# 	    'type'    => "ok",  
# 	    'icon'    => "info", 
# 	    'title'   => "This is title",
# 	    'message' => list.get(list.curselection())
# 	 )
#  }

# jeito 1
def myproc(list, text)
	# puts list.curselection()
	if list.curselection().size > 0
		msgBox = Tk.messageBox(
	    'type'    => "ok",  
	    'icon'    => "info", 
	    'title'   => "This is title",
	    'message' => list.get(list.curselection()) + text.value
	 )
	 list.insert 0, text.value		
	end

end

# msgBox = Tk.messageBox(
#    'type'    => "ok",  
#    'icon'    => "info", 
#    'title'   => "This is title",
#    'message' => "This is message"
# )


Tk.mainloop