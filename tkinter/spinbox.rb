require 'tk'

root = TkRoot.new
root.title = "Window"
sb = TkSpinbox.new(root) do
   to 100
   from 5
   increment 5
   pack("side" => "left",  "padx"=> "50", "pady"=> "50")
end

btn_OK = TkButton.new(root) do
   text "OK"
   command (proc {myproc(sb)})
   pack("side" => "right",  "padx"=> "50", "pady"=> "60")
end

def myproc(sb)
   puts "The user says OK." + sb.get  
   # exit
end


Tk.mainloop