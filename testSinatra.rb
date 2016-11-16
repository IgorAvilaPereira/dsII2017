# Install ruby
#iapereira@inspiron5448:~$ sudo apt-get install ruby-full
# Install sinatra
# iapereira@inspiron5448:~$ sudo apt-get install ruby-sinatra
# Executar: iapereira@inspiron5448:~$ ruby testSinatra.rb 
require 'sinatra' 

require 'sinatra/base'
require 'erb'

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


get '/template' do
   @foo = 'NANANANAN'
   erb :index
end
