require 'tk'
require 'tkextlib/bwidget'

root = TkRoot.new
root.title = "Window"

progressBar = Tk::BWidget::ProgressBar.new(root)

variable = TkVariable.new
progressBar.variable = variable
variable.value = 33
progressBar.maximum = 100
progressBar.place('height' => 25, 'width'  => 100, 'x'      => 10, 'y'      => 10)

btn_OK = TkButton.new(root) do
   text "OK"
   command (proc {myproc(variable)})
   pack("side" => "right",  "padx"=> "50", "pady"=> "60")
end

def myproc(variable)
   puts "The user says OK." + variable.value 
   variable.value  = 100
   puts "The user says OK." + variable.value 
   # exit
end


Tk.mainloop