require 'sinatra'

# rota inicial
get '/' do 
	erb :index	
end

get '/recebe/:parametro1/:parametro2' do
	# resposta para o ajax
	"Recebi o seguinte parametro:" + params['parametro1'] + " == " + params['parametro2']
end

get '/buscar/:campo' do
	# consulto o banco...
	# vejo se alguma coisa lah com esse campo
	# e caso tenha, retorna...
	vet = ["igor", "bruno", "heitor"]
	i = 0 
	while i < vet.size
		if vet[i] == params['campo']
			return "achei.."			
		end
		i = i + 1
	end
	return "deu xabum.."			
end


get '/listar' do
	# consulto o banco...
	# vejo se alguma coisa lah com esse campo
	# e caso tenha, retorna...
	vet = ["igor", "bruno", "heitor"]
	i = 0 
	conteudo = ""
	while i < vet.size
		conteudo =  conteudo + vet[i] + "<br>"
		i = i + 1
	end
	conteudo
end