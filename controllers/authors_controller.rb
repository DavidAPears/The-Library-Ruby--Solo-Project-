require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/author.rb' )
require_relative( '../models/book.rb' )

also_reload( '../models/*' )

# To retrieve all 'authors'

get '/authors' do
  @authors = Author.all()
  erb(:'authors/index')
end

# To search authors by id

get '/authors/:id' do
  @author = Author.find(params['id'].to_i)
  erb(:"authors/show")
end

# To add new authors

post '/authors/new' do
  Author.add(params[:id])
  redirect to("/authors/new")
end

# To delete 'author'

post '/authors/:id/delete' do
  Author.destroy(params[:id])
  redirect to("/authors")
end
