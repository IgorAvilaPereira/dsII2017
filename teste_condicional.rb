def preco_com_desconto(preco, desconto)
	preco - (preco * desconto)
end

i = 0 
while (i < 10)
	print "Preco:" + preco_com_desconto(100, 0.2).to_s
	i+=1
end

x = 5
if x > 5
  print "I am big!"
elsif x == 5
  print "I am medium!\n"
  #puts "\n"
else
  print "I am small!\n"
end

