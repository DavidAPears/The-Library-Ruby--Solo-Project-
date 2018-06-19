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


end
