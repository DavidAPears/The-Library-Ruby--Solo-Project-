require_relative( '../db/sql_runner' )
require('pry')

class Loan

  attr_reader( :id, :member_id, :book_id, :loan_start_date, :loan_length, :book_returned )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @book_id = options['book_id'].to_i
    @loan_start_date = options['loan_start_date']
    @loan_length = options['loan_length']
    @book_returned = options['book_returned']
  end

  def returned?()
    @book_returned == 't' ? 'Yes' : 'No'
  end


# CREATE 'C'

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

  def return_book()
    @book_returned = true
    update()
  end


  # READ 'R'

    def self.all()
      sql = "SELECT * FROM loans"
      results = SqlRunner.run( sql )
      return results.map { |loan| Loan.new( loan ) }
    end

    def self.find( id )
      sql = "SELECT * FROM loans
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Loan.new( results.first )
    end

  # UPDATE 'U'

  def update()
    sql = "UPDATE loans
    SET
    (
      member_id,
      book_id,
      loan_start_date,
      loan_length,
      book_returned
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@member_id, @book_id, @loan_start_date, @loan_length, @book_returned, @id]
    SqlRunner.run( sql, values )
  end

  # DELETE 'D'

  def delete()
    sql = "DELETE FROM loans
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM loans"
    SqlRunner.run( sql )
  end

# Below helps call names/titles rather than id's
  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def book()
    sql = "SELECT * FROM books
    WHERE id = $1"
    values = [@book_id]
    results = SqlRunner.run( sql, values )
    return Book.new( results.first )
  end

  def returned()
    @book_returned = true
    update()
  end


end
