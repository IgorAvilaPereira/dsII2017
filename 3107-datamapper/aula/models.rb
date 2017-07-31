require 'data_mapper' 
require 'dm-migrations'

# 1) SGBD
# 2) user
# 3) password
# 4) host
# 5) database
# "<SGBD>:/<USER>:<PASSWORD>@<HOST>/<DATABASE>"
DataMapper.setup(:default, 'postgres://postgres:postgres@localhost/aula')

class Professor
	include DataMapper::Resource

	property :id, Serial
	property :nome, String	
	property :apelido, String
	property :idade, Decimal
	# demais atributos, caso exista
	# .....
end

# declarar demais classes...
# ex.. 
#class Aluno
#end	


# apos declaracoes das classes de modelo
DataMapper.finalize

# mandar as declaracoes de classe para o banco, ou seja, mandar ver nas tabelas...
DataMapper.auto_migrate!
DataMapper.auto_upgrade!





