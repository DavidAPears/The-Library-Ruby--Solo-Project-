require_relative( '../db/sql_runner' )

class Author

  attr_reader( :id, :author )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @author = options['author']
  end

# CREATE 'C'

  def save()
    sql = "INSERT INTO authors
    (
      author
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@author]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # READ 'R'

    def self.all()
      sql = "SELECT * FROM authors"
      results = SqlRunner.run( sql )
      return results.map { |author| Author.new( author ) }
    end

    def self.find( id )
      sql = "SELECT * FROM authors
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Author.new( results.first )
    end

  # UPDATE 'U'

  def update()
    sql = "UPDATE authors SET author = $1 WHERE id = $2"
    values = [@author, @id]
    SqlRunner.run( sql, values )
  end

  # DELETE 'D'

  def delete()
    sql = "DELETE FROM authors
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

    def self.delete_all
      sql = "DELETE FROM authors"
      SqlRunner.run( sql )
    end


end
