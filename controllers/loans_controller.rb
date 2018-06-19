require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/loan.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/book.rb' )
require_relative( '../models/genre.rb' )
require_relative( '../models/author.rb' )

also_reload( '../models/*' )

# To retrieve all 'loans'
get '/loans' do
  @loans = Loan.all()
  erb(:'loans/index')
end

#To add new loans

get '/loans/new' do
  @members = Member.all
  @books = Book.all
  erb(:"loans/new")
end


# To Show individ loan
get '/loans/:id' do
  @loan = Loan.find(params['id'].to_i)
  erb(:"loans/show")
end

# To add new authors (2)

post '/loans' do
  data = params
  data['loan_start_date'] = Time.now
  loan = Loan.new(data)
  loan.save
  redirect to("/loans")
end



#To edit 'loans'

post '/loans/:id' do
  loan = Loan.new(params)
  loan.update()
  redirect to("/loans")
end

get '/loans/:id/edit' do
  @loan =  Loan.find(params[:id])
  erb(:"loans/edit")
end

# To delete 'loans'

post '/loans/:id/delete' do
  Loan.destroy(params[:id])
  redirect to("/loans")
end
