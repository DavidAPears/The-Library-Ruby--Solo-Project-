require_relative( '../db/sql_runner' )

class Book

  attr_reader( :id, :title, :author_id, :genre_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @author_id = options['author_id'].to_i
    @genre_id = options['genre_id'].to_i
  end

# CREATE 'C'

  def save()
    sql = "INSERT INTO books
    (
      title,
      author,
      genre_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @author_id, @genre_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # READ 'R'

    def self.all()
      sql = "SELECT * FROM books"
      results = SqlRunner.run( sql )
      return results.map { |book| Book.new( book ) }
    end

    def self.find( id )
      sql = "SELECT * FROM books
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Book.new( results.first )
    end

  # UPDATE 'U'



  # DELETE 'D'

    def self.delete_all
      sql = "DELETE FROM books"
      SqlRunner.run( sql )
    end


end
