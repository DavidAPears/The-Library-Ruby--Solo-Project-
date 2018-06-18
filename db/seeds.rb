require_relative( "../models/genre.rb" )
require_relative( "../models/book.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/loan.rb" )
require("pry")
#
# loan.delete_all()
# book.delete_all()
# member.delete_all()

genre1 = Genre.new({
  "genre" => "Historical Fiction"
})

genre1.save()

genre2 = Genre.new({
  "genre" => "Fantasy Fiction"
})

genre2.save()

book1 = Book.new({
  "title" => "The Great Gatsby",
  "author" => "F Scott Fitzgerald",
  "genre_id" => genre1.id
})

book1.save()

book2 = Book.new({
  "title" => "Harry Potter",
  "author" => "J K Rowling",
  "genre_id" => genre2.id
})

book2.save()

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

binding.pry
nil
