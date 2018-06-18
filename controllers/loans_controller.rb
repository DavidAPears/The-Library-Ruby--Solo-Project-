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

# To add new 'loans'

get '/loans/new' do
  @members = Member.all
  @books = Book.all
  erb(:"loans/new")
end

post '/loans' do
  loan = Loan.new(params)
  loan.save
  redirect to("/loans")
end

# To delete 'loans'

post '/loans/:id/delete' do
  Loan.destroy(params[:id])
  redirect to("/loans")
end
