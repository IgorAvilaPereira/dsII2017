require 'sinatra'
require 'erb'
require './models.rb'


get '/' do
	#@mensagem = Professor.count
	#erb :index
	redirect "/listar"
end

get '/tela_adicionar' do
	erb :tela_adicionar
end

get '/tela_alterar/:id' do
	professor = Professor.get(params['id'].to_i)
	@professor = professor
	erb :tela_alterar
end

post '/alterar' do
	professor = Professor.get(params[:id].to_i)
	professor.update(:nome => params[:nome], :apelido => params[:apelido])
	redirect "/"
end

post '/adicionar' do
	professor = Professor.new
	professor.nome = params[:nome]
	professor.apelido = params[:apelido]
	professor.save
	redirect "/"
end

get '/excluir/:id' do
	professor = Professor.get(params['id'].to_i)
	professor.destroy
	redirect "/"
end


get "/listar" do
	#@vet = Professor.all(:apelido.like => '%vidaL%')
	@vet = Professor.all
	erb :listar
end