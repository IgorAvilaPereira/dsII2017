require 'rubygems'
require 'sinatra'
require 'erb'
# sudo apt-get install libpq-dev
# sudo apt-get install postgresql-server-dev-all 
# sudo gem install dm-postgres-adapter
# sudo gem install data_mapper

require 'data_mapper' 
require 'dm-migrations'

# Conexao PostgreSQL:
#DataMapper.setup(:default, 'postgres://<user>:<senha>@<host>/<banco>')
DataMapper.setup(:default, 'postgres://postgres:postgres@localhost/teste')
 
# Conexao SQL3lite
#DataMapper.setup(:default, 'sqlite:///home/iapereira/project.db')

# modelo
class Post
  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end

# finaliza o bloco de descricao das tabelas/modelos
DataMapper.finalize

# criar as tabelas
# DataMapper.auto_migrate!

# destruir coisas velhas e criar as novas tabelas
DataMapper.auto_upgrade!

# tela_adicionar
get '/tela_adicionar' do
	erb :tela_adicionar
end

# tela_alterar
get '/tela_alterar/:id' do
	@post = Post.get(params['id'].to_i)
	erb :tela_alterar
end

# adicionar
post '/adicionar' do
  title = params['title']
  @post = Post.new(:title => title)
  @post.save 
  redirect '/'
end


# atualizar
post '/alterar' do
	post = Post.get(params['id'].to_i)
	if post.nil? == false 
		post.update(:title => params['title'])
	end
  	redirect '/'
end

# remover
get '/excluir/:id' do
	post = Post.get(params['id'].to_i)
	if post.nil? == false 
		post.destroy  # => true
	end
	redirect '/'
end

# listar
get '/' do
	@vetPost = Post.all
	erb :index
end



