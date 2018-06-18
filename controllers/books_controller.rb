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

# To search books by id
get '/books/:id' do
  @book = Book.find(params['id'].to_i)
  erb(:"books/show")
end

# To add new books

post '/loans/new' do
  Loan.add(params[:id])
  redirect to("/loans/new")
end

# To delete 'books'

post '/books/:id/delete' do
  Book.destroy(params[:id])
  redirect to("/books")
end
