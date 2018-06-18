require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/genre.rb' )
require_relative( '../models/book.rb' )

also_reload( '../models/*' )

get '/genres' do
  @genres = Genre.all()
  erb(:'genres/index')
end
