require 'sinatra'
require 'erb'
require './models.rb'


get '/' do
	@mensagem = Professor.count
	erb :index
	#redirect "/listar"
end

get '/tela_adicionar' do
	erb :tela_adicionar
end

get '/tela_alterar/:id' do
	professor = Professor.get(params['id'].to_i)
	@professor = professor
	erb :tela_alterar
end


get '/tela_alterar_aluno/:id' do
	# enviando para a tela_alterar_aluno o determinado aluno com o id vindo por get
	aluno = Aluno.get(params['id'].to_i)
	# atraves do @aluno a tela enxerga todo o objeto de aluno
	@aluno = aluno
	# para realizar o select do html
	@vetProfessor = Professor.all
	# enviando para a tela : tela_alterar_aluno
	erb :tela_alterar_aluno
end

post '/alterar' do
	professor = Professor.get(params[:id].to_i)
	professor.update(:nome => params[:nome], :apelido => params[:apelido])
	redirect "/"
end


post '/alterar_aluno' do
	aluno = Aluno.get(params[:id].to_i)
	professor = Professor.get(params[:professor_id].to_i)
	aluno.update(:nome => params[:nome], :professor => professor)
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
	#Aluno.destroy(:professor.id => )
=begin
	vetAluno = professor.alunos

	vetAluno.each do |aluno|
		aluno.destroy
	end
=end
	professor.destroy

	redirect "/"
end

get '/excluir_aluno/:id' do
	aluno = Aluno.get(params['id'].to_i)
	aluno.destroy
	redirect "/"
end



get "/listar" do
	#@vet = Professor.all(:apelido.like => '%vidaL%')
	@vet = Professor.all
	erb :listar
end

# CRUD - Alunos

get "/tela_adicionar_aluno" do
	@vetProfessor = Professor.all
	erb :tela_adicionar_aluno
end


post '/adicionar_aluno' do
	aluno = Aluno.new
	aluno.nome = params[:nome]
	aluno.professor = Professor.get(params[:professor_id].to_i) 
	if (aluno.save)
		puts "================"
		puts "FOi....."
		puts "================"
	else
		puts "================"
		puts "Nao...foi..."
		puts "================"
	end
	redirect "/"
end

get "/listar_aluno" do
	@vet = Aluno.all
	erb :listar_aluno
end

get "/listar_atendimento" do
	@vet = Atendimento.all
	erb :listar_atendimento
end

get "/tela_adicionar_atendimento" do
	#@vet = Atendimento.all
	erb :tela_adicionar_atendimento
end

get "/tela_incorporar_aluno/:atendimento_id" do
	@atendimento_id = params[:atendimento_id].to_i
	@vetAluno = Aluno.all
	erb :tela_incorporar_aluno
end

post "/incorporar_aluno" do
	atendimento = Atendimento.get(params[:atendimento_id].to_i)
	aluno = Aluno.get(params[:aluno_id])	
	atendimento.alunos << aluno
	atendimento.save
	
	#aluno.update(:atendimentos => aluno.atendimentos.push(atendimento))
	#atendimento.update(:alunos => 
	#atendimento.alunos.push(aluno))	


	redirect "/"
end

post "/adicionar_atendimento" do
	atendimento = Atendimento.new
	atendimento.dataHora = params[:dataHora]
	atendimento.save
	redirect "/"
end