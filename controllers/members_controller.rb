require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require_relative( '../models/loan.rb' )

also_reload( '../models/*' )

# To retrieve all loans:

get '/members' do
  @members = Member.all()
  erb(:'members/index')
end

# To add new 'members'

get '/members/new' do
  @members = Member.all
  @books = Book.all
  erb(:"members/new")
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect to("/members")
end

# To delete 'members'

post '/members/:id/delete' do
  Member.destroy(params[:id])
  redirect to("/members")
end
