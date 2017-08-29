require "tk"

root = TkRoot.new
root.title = "Programa"

menu_sobre = Proc.new {
   Tk.messageBox(
      'type'    => "ok",  
      'icon'    => "info",
      'title'   => "Sobre",
      'message' => "Programa desenvolvido por Igor Corporation LTDA"
   )
}

menu_exit = Proc.new {
   # Tk.messageBox(
   #    'type'    => "ok",  
   #    'icon'    => "info",
   #    'title'   => "Title",
   #    'message' => "Message"
   # )
   exit

}

menu_troca = Proc.new {
  resultsVar = TkVariable.new

  Lbl = TkLabel.new(root) do
     textvariable resultsVar
     borderwidth 5
     font TkFont.new('times 20 bold')
     foreground  "red"
     relief      "groove"
     pack("side" => "right",  "padx"=> "50", "pady"=> "50")
  end
  resultsVar.value = "oi"
}


file_menu = TkMenu.new(root)

file_menu.add('command',
              'label'     => "Sobre",
              'command'   => menu_sobre,
              'underline' => 0)
file_menu.add('command',
               'label'     => "Cria Frame",
               'command'   => menu_troca,
               'underline' => 0)
# file_menu.add('command',
#               'label'     => "Close",
#               'command'   => menu_click,
#               'underline' => 0)
# file_menu.add('separator')
# file_menu.add('command',
#               'label'     => "Save",
#               'command'   => menu_click,
#               'underline' => 0)
# file_menu.add('command',
#               'label'     => "Save As...",
#               'command'   => menu_click,
#               'underline' => 5)
file_menu.add('separator')

file_menu.add('command',
              'label'     => "Sair",
              'command'   => menu_exit,
              'underline' => 3)

menu_bar = TkMenu.new
menu_bar.add('cascade',
             'menu'  => file_menu,
             'label' => "Menu")

root.menu(menu_bar)
Tk.mainloop