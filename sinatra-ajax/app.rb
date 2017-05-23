require 'sinatra'

# rota inicial
get '/' do 
	erb :index	
end

get '/recebe/:parametro' do
	# resposta para o ajax
	"Recebi o seguinte parametro:" + params['parametro']
end