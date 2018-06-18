require_relative( '../db/sql_runner' )

class Loan

  attr_reader( :id, :member_id, :book_id, :id, :loan_start_date, :loan_length, :book_returned )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @book_id = options['book_id'].to_i
    @loan_start_date = options['loan_start_date']
    @loan_length = options['loan_length']
    @book_returned = options['book_returned']
  end

  def save()
    sql = "INSERT INTO loans
    (
      member_id,
      book_id,
      loan_start_date,
      loan_length,
      book_returned
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@member_id, @book_id, @loan_start_date, @loan_length, @book_returned]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


end
