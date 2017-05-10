require 'data_mapper' 

# sudo apt-get install libpq-dev
# sudo apt-get install postgresql-server-dev-all 
# sudo gem install dm-postgres-adapter
# sudo gem install data_mapper

DataMapper.setup(:default, 'postgres://postgres:postgres@localhost/db_datamapper')

class Post
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end

class Comment
  include DataMapper::Resource

  property :id,         Serial
  property :posted_by,  String
  property :email,      String
  property :url,        String
  property :body,       Text
end

class Post
  has n, :comments
end

class Comment
  belongs_to :post
end

DataMapper.finalize
DataMapper.auto_upgrade!

@post = Post.create(
  :title      => "My first DataMapper post",
  :body       => "A lot of text ...",
  :created_at => Time.now
)

comment = Comment.new
comment.posted_by = "Igor"
comment.email = "igor.pereira@riogrande.ifrs.edu.br"
comment.url = "http://www.google.com"
comment.body = "body"
post = Post.get(1)
comment.post = post
comment.save

