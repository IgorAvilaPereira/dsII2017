require 'data_mapper'
require 'dm-migrations'

DataMapper.setup(:default, 'postgres://postgres:postgres@localhost/aula2108')

class Post
	include DataMapper::Resource
	# chave
	property :id, Serial
	property :title, String, :required => true, :unique => true
	property :text, Text, :default => "Sem texto", :length => 9..20  
#	property :cpf_owner, String, :length => 11..11
=begin
	validates_with_method :methodCpf

	def methodCpf	
		return true
	end 
=end
end	

# class2
class Person
	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :job, String

	# por causa da heranca
	property :type, Discriminator
end

class Male < Person
	
end


# classe3


# definicao dos relacionamentos...

# fechando a declaracao
DataMapper.finalize
DataMapper.auto_migrate!
DataMapper.auto_upgrade!

