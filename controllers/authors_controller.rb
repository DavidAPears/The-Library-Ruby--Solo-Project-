require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/author.rb' )
require_relative( '../models/book.rb' )

also_reload( '../models/*' )

# To retrieve all 'authors'

get '/authors' do
  @authors = Author.all()
  erb(:'authors/index')
end

# To add new authors (1)

get '/authors/new' do
  @authors = Author.all
  erb(:"authors/new")
end

get '/authors/:id' do
  @author = Author.find(params['id'].to_i)
  # @books = @author.books need to write books method
  erb(:"authors/show")
end

# To add new authors (2)

post '/authors' do
  author = Author.new(params)
  author.save
  redirect to("/authors")
end

#To edit 'authors'

post '/authors/:id' do
  author = Author.new(params)
  author.update()
  redirect to("/authors")
end

get '/authors/:id/edit' do
  @author=  Author.find(params[:id])
  erb(:"authors/edit")
end

# To delete 'author'

post '/authors/:id/delete' do
  Author.delete(params[:id])
  redirect to("/authors")
end
