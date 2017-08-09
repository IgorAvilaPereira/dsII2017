require 'tk'

root = TkRoot.new { title "Hello, World!" }

TkLabel.new(root) do
   text 'Hello, World!'
   pack { padx 15 ; pady 15; side 'left' }
end

entry1 = TkEntry.new(root)
entry1.place('height' => 25, 'width'  => 150, 'x'   => 10, 'y'   => 20)

def buttonCommand(entry1)
	puts "The user says OK." +	entry1.get()
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
	command (proc {buttonCommand(entry1)})
    #command proc { buttonCommand }
	pack("side" => "right",  "padx"=> "50", "pady"=> "40")
end



Tk.mainloop