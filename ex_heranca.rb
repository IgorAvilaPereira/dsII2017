require 'pg'

class Pessoa
  attr_accessor :nome
  
  def initialize(nome = "")
    @nome = nome
  end
  def testePai
      puts "Chamando metodo do pai..."
  end
end

class Endereco
    attr_accessor :rua  
    def initialize(rua)
        @rua = rua
      end  
end

class PessoaFisica < Pessoa
  attr_accessor :cpf, :endereco
  
  def initialize(nome, cpf)
    @nome = nome
    @cpf = cpf
  end  

end

fisica = PessoaFisica.new("Igorwqewqewqewq", "01763917037")
fisica.endereco = Endereco.new("Presidente Vargas")
puts fisica.nome
puts fisica.endereco.rua
fisica.testePai

begin
    con = PG.connect :host => 'localhost', :dbname => 'teste', :user => 'postgres', :password => 'postgres'
    res = con.exec_params('INSERT INTO pessoafisica (nome) VALUES ($1);', [fisica.nome])

    rs = con.exec "SELECT * FROM pessoafisica LIMIT 5"

    rs.each do |row|
      puts "%s) %s " % [row['id'], row['nome']]
    end

rescue PG::Error => e
    puts e.message     
ensure
    con.close if con    
end