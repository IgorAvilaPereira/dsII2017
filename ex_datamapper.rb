require 'rubygems'

# sudo gem install data_mapper
# sudo apt-get install libpq-dev
# sudo apt-get install postgresql-server-dev-all 
# sudo gem install dm-postgres-adapter

require 'data_mapper' 

require 'dm-migrations'

# Conexao PostgreSQL:
#DataMapper.setup(:default, 'postgres://<user>:<senha>@<host>/<banco>')
DataMapper.setup(:default, 'postgres://postgres:postgres@localhost/testactiverecord')
 
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


# adicionar
@post = Post.new(:title => "testedatamappper")
@post.save # persist the resource

# remover
post2 = Post.get(1)
if post2.nil? == false 
	post2.destroy  # => true
end

# listar
vetPost = Post.all
vetPost.each do |p|
	puts p.title
end

# atualizar
post3 = Post.get(2)
post3.update(:title => 'Funky Town Municipal Zoo')

