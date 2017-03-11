# importar arquivos externos
require './biblioteca.rb'  

# importa (sem se preocupar o diretorio local)
#require_relative 'biblioteca.rb'  


# construtor com parametros
#pessoa = Pessoa.new("Igor")

# construtor vazio - parametro nome recebe o valor por falta = bambam
pessoa = Pessoa.new

# internamente esta chamando o set
pessoa.sobrenome = "Pereira"

# internamente esta chamando o get
puts pessoa.nome + " " + pessoa.sobrenome

puts pessoa.nome_completo

puts soma(1,2)