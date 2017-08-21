require "sinatra"
require "erb"
require "./models.rb"

get '/' do
	# post = Post.new(:title => "TituloUNico2",:text => "123456789111111111111",:cpf_owner => "01977856039")
	post = Post.new(:title => "TituloUNico2")
	if (post.save)
		@mensagem =  "Sucesso"  	
	else

		@mensagem =  "ERRO"  		
	end
	erb :index
end


get '/heranca' do
	masculino = Male.new(:name => "Pepeu Gomes...")
	masculino.save
	"ops..."
end

















# .....