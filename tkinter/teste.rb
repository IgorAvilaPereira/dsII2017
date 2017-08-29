require 'tk'

TkLabel.new { text 'Hello, World!' }

lbl = TkLabel.new() { justify 'center'
  text  'Hello, World!';
  pack('padx'=>5, 'pady'=>5, 'side' => 'top') }

text = TkVariable.new
text.value = "Campo"
entry = TkEntry.new('textvariable' => text) 
entry.pack

botao = TkButton.new() {
  text "Ok"
  command proc { 
  		lbl.configure('text'=> text.value) 
  }
  pack('side'=>'left', 'padx'=>10, 'pady'=>10)
}


b = TkButton.new() {
  #image    image1
 text "OkD"
 # command  proc { doit }
  pack('side'=>'right', 'padx'=>10, 'pady'=>10)

}

b.bind("ButtonPress") { 
 	puts "oi"
 }

Tk.mainloop