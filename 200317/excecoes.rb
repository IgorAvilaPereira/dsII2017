print "Digite um número:"
numero = gets.to_i

begin
  puts (100 / numero).to_s
rescue
  puts "Número digitado inválido!"
  exit
end