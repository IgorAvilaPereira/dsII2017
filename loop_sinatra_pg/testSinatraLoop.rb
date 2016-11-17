# Install ruby
#iapereira@inspiron5448:~$ sudo apt-get install ruby-full
# Install sinatra
# iapereira@inspiron5448:~$ sudo apt-get install ruby-sinatra
# Executar: iapereira@inspiron5448:~$ ruby testSinatra.rb 
require 'sinatra' 
require 'sinatra/base'
# templates
require 'erb'
# pg
require 'pg'

# teste conexao
conn = PGconn.connect("localhost", 5432, '', '', "test", "postgres", "postgres")

# views...

get '/' do 
  "Just Do It" 
end

get '/pintao' do 
  "oi..." 
end

get '/raquel' do 
  "Raquel...HelloWorld" 
end

# http://stackoverflow.com/questions/4683057/simple-example-of-postgres-query-in-ruby
# teste select
#res  = conn.exec('select * from department')

#res.each do |row|
#  puts row['id'] + ' | ' + row['name']
#end

get '/postgres' do 
	# http://www.rubydoc.info/gems/pg/PG/Connection
	# insert
	res = conn.exec_params('INSERT INTO department (name) VALUES ($1)', ['sinatra'])
	"HelloWorld PostgreSQL" 
end

get '/template' do
	@foo = 'NANANANAN'
	@res  = conn.exec('select * from department')
	#res.each do |row|
	#	puts row['id'] + ' | ' + row['name']
	#end
   erb :index
end

# https://wixelhq.com/blog/working-with-sinatra-routes-and-conditions
# http://www.sinatrarb.com/intro.html#Routes
get '/testeget/:id' do  
  "oi:" + params[:id]
end

# https://code.tutsplus.com/tutorials/singing-with-sinatra--net-18965
post '/testepost' do  
  "You said '#{params[:nome]}'"
end

get '/form' do  
  erb :form
end


# redirecionamento...
# http://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/


# session 
# http://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/
# http://www.getlaura.com/how-to-enable-sessions-with-sinatra/
	