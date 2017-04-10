require 'pg'

# camada de modelo

class Animal
	attr_accessor :id, :nome, :especie
	def to_s
		@id.to_s + ";" + @especie + ";" + @nome
	end
end

# camada de persistencia

class AnimalDAO
	def initialize
		@con = PG.connect :dbname => 'zoo', 
		:user => 'postgres', 
        :password => 'postgres',
        :host => 'localhost'
    end
    def obter(id)
    	rs = @con.exec_params("SELECT * FROM animais WHERE id = $1", [id])
  		animal = Animal.new
    	rs.each do |registro|
      		animal.id = registro['id'].to_i
      		animal.especie = registro['especie'].to_s
      		animal.nome = registro['nome'].to_s      		
    	end 
    	animal
    end
    def editar(animal)
	  	rs = @con.exec_params("UPDATE animais SET especie = $1, nome = $2 WHERE id = $3", [animal.especie, animal.nome, animal.id])
    end
    def adicionar(animal)    	   
    	rs = @con.exec_params("INSERT INTO animais (especie, nome) VALUES ($1, $2)", [animal.especie, animal.nome])
    end
    def listar
    	vetAnimal = []
    	rs = @con.exec "SELECT * FROM animais"
    	rs.each do |registro|
      		animal = Animal.new
      		animal.id = registro['id'].to_i
      		animal.especie = registro['especie'].to_s
      		animal.nome = registro['nome'].to_s
      		vetAnimal.push(animal)
    	end  
    	vetAnimal
    end
    def excluir(id)    	
    	@con.exec_params("DELETE FROM animais WHERE id = $1", [id])
    end	
end	    

# camada de view

animalDAO = AnimalDAO.new

=begin
puts "Digite a especie:"    
especie = gets.chomp
puts "Digite um nome:"
nome = gets.chomp 
animal = Animal.new
animal.especie = especie
animal.nome = nome
animalDAO.adicionar(animal)

vetAnimal = animalDAO.listar()
#puts vetAnimal

vetAnimal.each do |registro|
	puts registro.id.to_s + ";" + registro.especie + ";" + registro.nome
end


animalDAO.excluir(8)
animalDAO.excluir(9)
animalDAO.excluir(10)
=end

animal = animalDAO.obter(5)
animal.especie = "Snape"
animalDAO.editar(animal)
#puts animal

