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


#To edit 'members'


post '/members/:id' do
  member = Member.new(params)
  member.update()
  redirect to("/members")
end

get '/members/:id/edit' do
  @member =  Member.find(params[:id])
  erb(:"members/edit")
end


# To delete 'members'

get '/members/:id/delete' do
  member = Member.find(params[:id])
  member.delete()
  redirect to("/members")
end
