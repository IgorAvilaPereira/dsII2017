#require "./biblioteca.rb"
require_relative "biblioteca.rb"

=begin
puts "Digite o nro1:"
nro1 = gets.to_i

puts "Digite o nro2:"
nro2 = gets.to_i
soma = 0
if (nro2 == 0)
	soma = soma(nro1)
else
	soma = soma(nro1, nro2)
end


puts "Resultado:"+ soma.to_s 
=end

puts fatorial(gets.to_i)
