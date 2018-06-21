require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/member.rb' )
require_relative( '../models/loan.rb' )

also_reload( '../models/*' )

# To add new members (i.e new member icon link):

get '/members' do
  @members = Member.all()
  erb(:'members/index')
end

#This should link each member from this page to thier own opage...it doesn't work...
# get '/members/:id' do
#   @member = Member.find(params['id'].to_i)
#   erb(:"members/show")
# end


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


# To delete members with no loans:-

get '/members/:id/delete' do
  member = Member.find(params[:id])
  member.delete()
  redirect to("/members")
end




# Create a route that will call on deactivate
get '/members/:id/deactivate' do
  @member =  Member.find(params[:id])
  erb(:"members/deactivate")
end

post '/members/:id/deactivate' do
  member =  Member.find(params[:id])
  member.deactivate()

  redirect to("/members")
end

# post '/members/:id' do
#   member =  Member.find(params[:id])
#   redirect to("/members")
# end
