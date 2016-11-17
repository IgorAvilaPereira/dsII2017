# http://stackoverflow.com/questions/3116015/how-to-install-postgresqls-pg-gem-on-ubuntu
# sudo apt-get install libpq-dev
# gem install pg  --   --with-pg-lib=/usr/lib   
# https://deveiate.org/code/pg/PG/Connection.html

# Windows
# https://marcclifton.wordpress.com/2012/11/12/installing-postgresql-for-use-with-ruby-in-windows/

require 'pg'

# teste conexao
conn = PGconn.connect("localhost", 5432, '', '', "test", "postgres", "postgres")

# http://stackoverflow.com/questions/4683057/simple-example-of-postgres-query-in-ruby
# teste select
res  = conn.exec('select * from department')

res.each do |row|
  puts row['id'] + ' | ' + row['name']
end

# http://www.rubydoc.info/gems/pg/PG/Connection
# insert
res = conn.exec_params('INSERT INTO department (name) VALUES ($1)', ['Ruby'])
