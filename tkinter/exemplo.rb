require 'tk'

root = TkRoot.new { title "Hello, World!" }

entry1 = TkEntry.new(root)
entry1.place('height' => 25, 'width'  => 100, 'x'   => 20, 'y'   => 15)

TkLabel.new(root) do
   text 'Digite:'
   pack { padx 15 ; pady 30; side 'left' }
end

# acao de um botao...
def actionTkButton(root)
	#variable1 = TkVariable.new
	#entry1.textvariable = variable1
	#variable1.value = "Hello World"
	puts "The user says OK."
	#exit
end


list = TkListbox.new(root) do
   width 20
   height 10
   setgrid 1
   selectmode 'multiple'
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
   
   # acao de um botao - metodo 1
   #command (proc {actionTkButton(root)})

   # acao de um botao - metodo 2
   command {
   		# pegando o valor do entry
   		#variable1 = TkVariable.new
		#entry1.textvariable = variable1
		# setando um valor
		#variable1.value = "Testando...."
		# inserindo...
		entry1.insert(0, "oi") 
		# retornando..
		msgBox = Tk.messageBox(
		   'type'    => "ok",  
		   'icon'    => "info", 
		   'title'   => "This is title",
		   'message' => entry1.get
		)
  		print entry1.get + " \n\n\n push button2!!\n"   	
  		print list.get(list.curselection[0])
   }
   pack("side" => "left",  "padx"=> "50", "pady"=> "40")
end



Tk.mainloop