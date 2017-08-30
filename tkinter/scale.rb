require "tk"

# com $ a variavel fica global
# http://www.techotopia.com/index.php/Ruby_Variable_Scope
$scale = TkScale.new {
   orient 'horizontal'
   length 280
   from 0
   to 250
   command (proc {printheight})
   tickinterval 50
   pack
}

def printheight
   height = $scale.get()
   print height, "\n"
end

Tk.mainloop