require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative( '../models/genre.rb' )

also_reload( '../models/*' )


get '/books' do
  @books = Book.all()
  erb(:'books/index')
end
