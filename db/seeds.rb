require_relative( "../models/author.rb" )
require_relative( "../models/genre.rb" )
require_relative( "../models/book.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/loan.rb" )
require("pry")

loan.delete_all()
book.delete_all()
member.delete_all()
genre.delete_all()
author.delete_all()

# TABLE 1 - 'AUTHORS'

author1 = Author.new({
  "author" => "F Scott Fitzgerald"
})

author1.save()

author2 = Author.new({
  "author" => "J K Rowling"
})

author2.save()

author3 = Author.new({
  "author" => "Stephen Hawking"
})

author3.save()

# TABLE 2 - 'GENRES'

genre1 = Genre.new({
  "genre" => "Historical Fiction"
})

genre1.save()

genre2 = Genre.new({
  "genre" => "Fantasy Fiction"
})

genre2.save()

genre3 = Genre.new({
  "genre" => "Popular Science"
})

genre3.save()

# TABLE 3 - 'BOOKS'

book1 = Book.new({
  "title" => "The Great Gatsby",
  "author_id" => author1.id,
  "genre_id" => genre1.id
})

book1.save()

book2 = Book.new({
  "title" => "Harry Potter",
  "author_id" => author2.id,
  "genre_id" => genre2.id
})

book2.save()

book3 = Book.new({
  "title" => "A Brief History of Time",
  "author_id" => author3.id,
  "genre_id" => genre3.id
})

book3.save()

# TABLE 4 - 'MEMBERS'

member1 = Member.new({
  "first_name" => "David",
  "last_name" => "Pears",
  "post_code" => "EH8 8EY",
  "email_address" => "davidapears@gmail.com",
  "active_membership" => true
})

member1.save()

member2 = Member.new({
  "first_name" => "Fred",
  "last_name" => "Bloggs",
  "post_code" => "EH7 1SL",
  "email_address" => "fredblogs@hotmail.com",
  "active_membership" => false
})

member2.save()

member3 = Member.new({
  "first_name" => "Jessica",
  "last_name" => "Smith",
  "post_code" => "EH2 3UT",
  "email_address" => "jessica375@yahoo.co.uk",
  "active_membership" => true
})

member3.save()

# TABLE 5 - 'LOANS'

loan1 = Loan.new({
  "member_id" => member1.id,
  "book_id" => book1.id,
  "loan_start_date" => Time.now,
  "loan_length" => 14,
  "book_returned" => false
})

loan1.save()

loan2 = Loan.new({
  "member_id" => member2.id,
  "book_id" => book2.id,
  "loan_start_date" => Time.now,
  "loan_length" => 14,
  "book_returned" => false
})

loan2.save()

loan3 = Loan.new({
  "member_id" => member3.id,
  "book_id" => book3.id,
  "loan_start_date" => Time.now,
  "loan_length" => 14,
  "book_returned" => false
})

loan3.save()

binding.pry
nil
