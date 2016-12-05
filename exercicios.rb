vetor = [1,2,3,4,5,6,7,8,9,10]

i = 0
resultado = 0
while (i < 10)
	resultado += vetor[i]
	i+=1
end

def media(vetor)
	i = 0
	resultado = 0.0
	while (i < vetor.size)
		resultado += vetor[i]
		i+=1
	end
	resultado/vetor.size
end

vetorNota1 = [10, 7]
vetorNota2 = [4,  7]
vetorMedia = [0, 0]

i = 0
while (i < vetorNota1.size)
	vetorMedia[i] = (vetorNota1[i] + vetorNota2[i])/2.0		
	i+=1
end

print vetorMedia

print "\nResultado:" + resultado.to_s + "\n"
print "\nMedia:" + media(vetor).to_s + "\n"


#'Se x=10 e y=20, ao final das operações x deve ser igual a 20 e y igual a 10.

x, y = 10, 20
x,y =  y, x
print "X e Y originais:" + x.to_s + "," + y.to_s + "\n"
print "X e Y trocados:" + x.to_s + "," + y.to_s + "\n"

nome = "Igor"

print "Tamanho:" + nome.size.to_s


item1 = "6 ovos"
item2 = "1 quilo de farinha"
item3 = "1 litro de leite"
item4 = "2 tabletes de manteiga"
item5 = "3 xícaras de açúcar"
item6 = "7 sacos de carvão"

vetorIngrediente = [0,0,0,0,0]
alfabeto = ['a','b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'w', 'v', 'x', 'y', 'z']

for letra in alfabeto do
	item1 = item1.gsub(letra, "")
end

for letra in alfabeto do
	item2 = item2.gsub(letra, "")
end


for letra in alfabeto do
	item3 = item3.gsub(letra, "")
end


for letra in alfabeto do
	item4 = item4.gsub(letra, "")
end


for letra in alfabeto do
	item5 = item5.gsub(letra, "")
end

for letra in alfabeto do
	item6 = item6.gsub(letra, "")
end

print "\n"
print item1.to_i 
print "\n"
print item2.to_i 
print "\n"
print item3.to_i 
print "\n"
print item4.to_i 
print "\n"
print item5.to_i
print "\n"
print item6.to_i
print "\n"
print "Total:"
print item1.to_i + item2.to_i + item3.to_i + item4.to_i + item5.to_i + item6.to_i
print "\n"


# lendo o nome e removendo o caracter de fim da linha....
nome = gets.chomp
puts nome
if nome == "Igor"
	print "Eh mesmo..."
elsif nome == "betito"
	print "eh betito"
else
	print "NOps..."	
end


nota1 = gets.to_f
nota2 = gets.to_f
media = (nota1*2+nota2*3)/5
media_str = "%.1f" % media
puts media_str