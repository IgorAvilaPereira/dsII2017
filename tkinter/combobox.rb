require 'tk'
require 'tkextlib/bwidget'

root = TkRoot.new
root.title = "Janela"

combobox = Tk::BWidget::ComboBox.new(root)
combobox.values = [1, 2, 3, 4]
combobox.place('height' => 25, 
               'width'  => 100, 
               'x'   => 10, 
               'y'   => 10 )

btn_OK = TkButton.new(root) do
   text "OK"
   # borderwidth 5
   # underline 0
   # state "normal"
   # cursor "watch"
   # font TkFont.new('times 20 bold')
   # foreground  "red"
   # activebackground "blue"
   # relief      "groove"
   command (proc {myproc(combobox)})
   pack("side" => "right",  "padx"=> "50", "pady"=> "60")
end

def myproc(combobox)
   puts "The user says OK." + combobox.text  
   # exit
end

Tk.mainloop