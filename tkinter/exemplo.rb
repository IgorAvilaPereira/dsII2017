require 'tk'

root = TkRoot.new { title "Hello, World!" }
entry1 = TkEntry.new(root)
entry1.place('height' => 25, 'width'  => 150, 'x'   => 10, 'y'   => 10)


TkLabel.new(root) do
   text 'Hello, World!'
   pack { padx 15 ; pady 15; side 'left' }
end

# acao de um botao...
def actionTkButton(root)
	#variable1 = TkVariable.new
	#entry1.textvariable = variable1
	#variable1.value = "Hello World"
	puts "The user says OK."
	#exit
end




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
   		variable1 = TkVariable.new
		entry1.textvariable = variable1
		variable1.value = "Testando...."
   		print "push button2!!\n" +  variable1.value
   }
   pack("side" => "left",  "padx"=> "50", "pady"=> "10")
end

Tk.mainloop