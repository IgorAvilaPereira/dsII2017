# encoding: utf-8

# sinatra
require 'sinatra' 
require 'sinatra/base'

# templates
require 'erb'
require 'tilt/erb'

# email - sudo gem install pony
require 'pony'

# sessao
# ativando sessao
enable :sessions

# criando a palavra chave 
set :session_secret, 'palavrasecreta_ex'

before do
  puts "===================="
  puts "abrindo alguma rota"
  puts "===================="
end

get '/' do
  session[:ana] = "heitor"
  erb :index
end

after do
  puts "===================="
  puts "renderizando....a rota"
  puts "===================="
end

get '/mudanca' do
  session[:ana] = "bruno"
  #erb :mostra
  redirect '/mostra'
end

get '/mostra' do
  @variavelSessao = session[:ana]
  erb :mostra
end

get '/remove' do
  session.delete(:ana)
  redirect '/'
end

post '/upload' do
  extensao = File.extname(params['arquivo'][:filename])

  File.open('./public/upload/' + "igor"+extensao, "w") do |f|
    f.write(params['arquivo'][:tempfile].read)
  end

  #f = File.open('./public/upload/' + "igor"+extensao, "w")
  #f.write(params['arquivo'][:tempfile].read)

  "O Arquivo foi enviado com sucesso!"
end

# upload excluir - deleta somente (neste exemplo) soh arquivo igor.txt
get '/upload_excluir' do
    filename = "igor.txt" 
    File.delete("./public/upload/#{filename}")
    redirect '/'
end


get '/utiliza_outro_layout' do
  # vai abrir batata utilizando layout_backup
  erb :batata, :layout => :layout_backup
end


# email
get '/email' do  
  Pony.options = {
      :subject => "Assunto",
      :body => "Mensagem",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'tadsifrsrg@gmail.com ',
        :password             => "tadsifrsrgtadsifrsrg",
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain"
      }
    }
    Pony.mail(:to => "igor.pereira@riogrande.ifrs.edu.br")
    redirect '/'
end












=begin
configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  unless session[:identity]
    session[:previous_url] = request.path
    @error = 'Sorry, you need to be logged in to visit ' + request.path
    halt erb(:login_form)
  end
end
=end


=begin
post '/login/attempt' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from
end
 

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end

get '/secure/place' do
  erb 'This is a secret place that only <%=session[:identity]%> has access to!'
end
=end