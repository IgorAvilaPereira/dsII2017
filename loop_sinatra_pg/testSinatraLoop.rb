# Install ruby
# sudo apt-get install ruby-full

# Install sinatra
# sudo apt-get install ruby-sinatra

# Executar: 
# ruby testSinatra.rb 

# Suporte PostgreSQL
# http://stackoverflow.com/questions/3116015/how-to-install-postgresqls-pg-gem-on-ubuntu
# https://deveiate.org/code/pg/PG/Connection.html
# sudo apt-get install libpq-dev
# gem install pg  --   --with-pg-lib=/usr/lib   

require 'sinatra' 
require 'sinatra/base'
# templates
require 'erb'
# pg
require 'pg'

# habilitar sessao
enable :sessions
# habilitar chave unica da sessao
set :session_secret, 'secret'

# conexao
conn = PGconn.connect("localhost", 5432, '', '', "test", "postgres", "postgres")

# rotas...

# index
get '/' do 
  "Pagina Inicial..." 
end

get '/rota1' do 
  "Rota1..." 
end

get '/rota2' do 
  "Rota2" 
end

# teste insert dentro de uma rota
get '/postgres' do 
	# http://www.rubydoc.info/gems/pg/PG/Connection
	# insert
	res = conn.exec_params('INSERT INTO department (name) VALUES ($1)', ['sinatra'])
	"HelloWorld PostgreSQL" 
end

# testando template erb - loop e variaveis simples
get '/template' do
	@foo = 'vindo da rota'
	@res  = conn.exec('select * from department')
	#res.each do |row|
	#	puts row['id'] + ' | ' + row['name']
	#end
   erb :index
end

# Dados vindos por get
# https://wixelhq.com/blog/working-with-sinatra-routes-and-conditions
# http://www.sinatrarb.com/intro.html#Routes
get '/testeget/:id' do  
  "oi:" + params[:id]
end

# armazenar valores na sessao / Dados por post
# https://code.tutsplus.com/tutorials/singing-with-sinatra--net-18965
post '/testepost' do  
	# o dado vindo por post eh armazenado na sessao
	session[:nome] = params[:nome]
	# mostra no navegador
 	"Venho do Form: '#{params[:nome]}'"
end

# a rota busca o form.erb que esta dentro do diretorio view
get '/form' do  
  erb :form
end

# redirecionamento...
# http://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/
get '/vaiproform' do
	redirect('/form')
end


# session 
# http://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/
# http://www.getlaura.com/how-to-enable-sessions-with-sinatra/
# http://stackoverflow.com/questions/18844863/sinatra-clears-session-on-post
# http://brettu.com/ruby-daily-ruby-tips-60-simple-use-of-sessions-in-sinatra/

get '/mostrasessao' do
	"Session:"+ session[:nome]
end

# destruir
# session.clear
get '/destruisessao' do
	session.clear
	redirect('/form')
end



