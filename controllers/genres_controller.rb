require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/genre.rb' )
require_relative( '../models/book.rb' )

also_reload( '../models/*' )

# To retrieve all 'genres'

get '/genres' do
  @genres = Genre.all()
  erb(:'genres/index')
end

# To search genres by id

get '/genres/:id' do
  @genre = Genre.find(params['id'].to_i)
  erb(:"genres/show")
end

# To add new genres

post '/genres/new' do
  Genre.add(params[:id])
  redirect to("/genres/new")
end

# To delete 'loans'

post '/loans/:id/delete' do
  Loan.destroy(params[:id])
  redirect to("/loans")
end

# To delete 'genres'

post '/genres/:id/delete' do
  Genre.destroy(params[:id])
  redirect to("/genres")
end
