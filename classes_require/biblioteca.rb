#puts "Igor"

# funcao isolada
def soma(n1, n2)
	n1+n2
end


class Pessoa
	# atributos + get/set
	attr_accessor :nome, :sobrenome
	# construtor	
  	def initialize(nome = "Bambam")
  		@nome = nome
  		puts "Construtor..."
  	end 
  	def nome_completo
  		@nome + " " + @sobrenome  		
  	end
end