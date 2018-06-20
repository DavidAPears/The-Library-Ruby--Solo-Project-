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

# To add new genres (1)

get '/genres/new' do
  @genres = Genre.all
  erb(:"genres/new")
end

get '/genres/:id' do
  @genre = Genre.find(params['id'].to_i)
  erb(:"genres/show")
end

# To add new genres (2)

post '/genres' do
  genre = Genre.new(params)
  genre.save
  redirect to("/genres")
end

#To edit 'genres'

post '/genres/:id' do
  genre = Genre.new(params)
  genre.update()
  redirect to("/genres")
end

get '/genres/:id/edit' do
  @genre = Genre.find(params[:id])
  erb(:"genres/edit")
end


# To search genres by id

get '/genres/:id' do
  @genre = Genre.find(params['id'].to_i)
  erb(:"genres/show")
end

# # To add new genres

post '/genres/new' do
  Genre.add(params[:id])
  redirect to("/genres/new")
end


# To delete 'genres'

post '/genres/:id/delete' do
  Genre.delete(params[:id])
  redirect to("/genres")
end
