# encoding: utf-8

# para rotas
require 'sinatra'
# para templates
require 'erb'

require './database.rb'

# pagina inicial
get '/' do
	@m = ""
	erb :form
end

post '/alterar' do
	animal = Animal.new
	animal.id = params['id'].to_i
	animal.nome = params['nome'].to_s
	animal.especie = params['especie'].to_s
	animalDAO =  AnimalDAO.new
	animalDAO.editar(animal)
	redirect '/listar'
end

get '/tela_alterar/:id' do
	animalDAO = AnimalDAO.new
	@animal = animalDAO.obter(params['id'].to_i)
	erb :tela_alterar
end

get '/excluir/:id' do
	animalDAO = AnimalDAO.new
	animalDAO.excluir(params['id'].to_i)
	redirect '/listar'
end

get '/listar' do
	animalDAO = AnimalDAO.new
	@vetAnimal = animalDAO.listar
	erb :listar
end 

post '/adicionar' do
	animal = Animal.new
	animal.nome  = params['nome'].to_s  
	animal.especie = params['especie'].to_s  
	animalDAO = AnimalDAO.new
	if animal.nome.length > 0 && animal.especie.length > 0
		animalDAO.adicionar(animal)
		# mensagem de sucesso - vai pra onde? => pro form
		@m = "Funfou!!!"
	else
		# mensagem de fracasso - vai pra onde? => pro form tb
		@m = "Deu xabum!!!"
	end 
	# manda pro form de novo (by laura)
	erb :form
	# redirecionamento
	# redirect '/'
end


















