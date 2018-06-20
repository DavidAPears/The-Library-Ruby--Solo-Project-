require_relative( "../models/author.rb" )
require_relative( "../models/genre.rb" )
require_relative( "../models/book.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/loan.rb" )

require("pry")


# book.delete_all()
# member.delete_all()
# genre.delete_all()
# author.delete_all()
# loan.delete_all()


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

author4 = Author.new({
  "author" => "Ernest Hemingway"
})

author4.save()

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

genre4 = Genre.new({
  "genre" => "Literary fiction"
})

genre4.save()

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

book4 = Book.new({
  "title" => "The Old Man and the Sea",
  "author_id" => author4.id,
  "genre_id" => genre4.id
})

book4.save()

# TABLE 4 - 'MEMBERS'

member1 = Member.new({
  "first_name" => "Rick",
  "last_name" => "Sanchez",
  "post_code" => "EH8 8EY",
  "email_address" => "wubalubadubdub@gmail.com",
  "active_membership" => true
})

member1.save()

member2 = Member.new({
  "first_name" => "Morty",
  "last_name" => "Smith",
  "post_code" => "EH7 1SL",
  "email_address" => "ohjeez@ohjeezcom",
  "active_membership" => false
})

member2.save()

member3 = Member.new({
  "first_name" => "Bird",
  "last_name" => "Person",
  "post_code" => "EH2 3UT",
  "email_address" => "birdperson@birdworld.tv",
  "active_membership" => true
})

member3.save()

member4 = Member.new({
  "first_name" => "Million",
  "last_name" => "Ants",
  "post_code" => "EH3 6NS",
  "email_address" => "ant@colony.com",
  "active_membership" => true
})

member4.save()

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
  "book_returned" => true
})

loan3.save()

loan4 = Loan.new({
  "member_id" => member4.id,
  "book_id" => book4.id,
  "loan_start_date" => Time.now,
  "loan_length" => 7,
  "book_returned" => true
})

loan4.save()

binding.pry
nil
