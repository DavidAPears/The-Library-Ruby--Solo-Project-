require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/loan.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/book.rb' )
require_relative( '../models/genre.rb' )
require_relative( '../models/author.rb' )

also_reload( '../models/*' )

# get '/loans' do
#   @loans = Loan.all()
#   erb(:'loans/index')
# end
