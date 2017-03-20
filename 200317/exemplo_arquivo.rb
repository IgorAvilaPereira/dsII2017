
arq = File.new("arquivo.txt", "w")
arq.write("PHP\n")
arq.write("Ruby\n")
arq.close()

arq = File.open("arquivo.txt")
linha = arq.readline
puts linha
linha = arq.readline
puts linha
arq.close


