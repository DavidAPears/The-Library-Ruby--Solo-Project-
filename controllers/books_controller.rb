require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative( '../models/genre.rb' )

also_reload( '../models/*' )

# To retrieve all 'books'

get '/books' do
  @books = Book.all()
  erb(:'books/index')
end

# To add new books (1)

get '/books/new' do
  @books = Book.all
  @authors = Author.all
  @genres = Genre.all
  erb(:"books/new")
end

get '/books/error' do
  erb(:"books/error")
end

get '/books/:id' do
  @book = Book.find(params['id'].to_i)
  erb(:"books/show")
end

# To add new books (2)

post '/books' do
  book = Book.new(params)
  book.save
  redirect to("/books")
end


#To edit 'books'

post '/books/:id' do
  book = Book.new(params)
  book.update()
  redirect to("/books")
end

get '/books/:id/edit' do
  @book = Book.find(params[:id])
  erb(:"books/edit")
end

# To search books by id
# get '/books/:id' do
#   @book = Book.find(params['id'].to_i)
#   erb(:"books/show")
# end

#To search books by title
get '/books/:name' do
  @book = Book.find_title(params['name'])
  erb(:"books/show")
end

# To delete 'books'

get '/books/:id/delete' do
  book = Book.find(params[:id])
  if book.members.count == 0
    book.delete()
    redirect to("/books")
  end
  redirect to("/books/error")
end
