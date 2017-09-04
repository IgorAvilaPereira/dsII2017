require "tk"

require 'tkextlib/bwidget'



def myproc(entry1,entry2, list)
   recebido = entry1.get
   recebido = recebido + "\n"
   recebido = recebido + entry2.get
   recebido = recebido + list.get(list.curselection[0])

   # retornando..
   msgBox = Tk.messageBox(
      'type'    => "ok",  
      'icon'    => "info", 
      'title'   => "Informações",
      'message' => recebido
   )
end

root = TkRoot.new
root.title = "Window"
root.height = 400
root.width = 400

entry1 = TkEntry.new(root)
entry2 = TkEntry.new(root) do
   show '*'
end

label1 = TkLabel.new(root) do 
   text "Nome:"
end

# componente novo
list = TkListbox.new(root) do
   width 20
   height 100
   setgrid 1
   selectmode 'single'
   pack('fill' => 'x')
end

button1 = TkButton.new(root) do
   text "OK" 
   command (proc {myproc(entry1, entry2, list)})  
end




label2 = TkLabel.new(root) do
   text "Senha:"
end


list.insert 0, "yellow", "gray", "green",
  "blue", "red", "black", "white", "cyan",
  "pink", "yellow", "orange", "gray"

combobox = Tk::BWidget::ComboBox.new(root)
combobox.values = ["Tobias", "Rex", "Tobby", "Gothan"]
combobox.place('height' => 25, 
               'width'  => 100, 
               'x'   => 10, 
               'y'   => 300 )

def myproc2(combobox,  variable)
    # retornando..
    print  variable.value
   msgBox = Tk.messageBox(
      'type'    => "ok",  
      'icon'    => "info", 
      'title'   => "Informações",
      'message' => combobox.text
   )
end



progressBar = Tk::BWidget::ProgressBar.new(root)
variable = TkVariable.new
progressBar.variable = variable
variable.value = 33
progressBar.maximum = 100
# progressBar.place('height' => 25, 'width'  => 100, 'x'      => 10, 'y'      => 10)


button2 = TkButton.new(root) do
   text "OK2" 
   command (proc {myproc2(combobox,variable)})  
end

entry1.place('height' => 25, 'width'  => 150, 'x'   => 55, 'y'   => 10)
label1.place('height' => 25, 'width'  => 40, 'x'   => 5, 'y'   => 10)
button1.place('height' => 25, 'width'  => 40, 'x'   => 5, 'y'   =>  100)
button2.place('height' => 25, 'width'  => 40, 'x'   => 55, 'y'   =>  100)
entry2.place('height' => 25, 'width'  => 150, 'x'   => 55, 'y'   => 40)
label2.place('height' => 25, 'width'  => 40, 'x'   => 5, 'y'   => 40)
# linha nova
list.place('height' => 100, 'width' => 100, 'x' => 5 , 'y' => 150)
Tk.mainloop

