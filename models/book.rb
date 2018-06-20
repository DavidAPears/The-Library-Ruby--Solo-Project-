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
      author_id,
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

# INNER JOIN (Books & Members)

  def members
    sql = "SELECT members.* FROM members INNER JOIN loans ON loans.member_id = members.id WHERE book_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Member.map_items(results)
  end

  def self.map_items(book_data)
    result = book_data.map { |book|
    Book.new( book ) }
    return result
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

    def self.find_title( title )
      sql = "SELECT * FROM books
      WHERE title = $1"
      values = [title]
      results = SqlRunner.run( sql, values )
      return Book.new( results.first )
    end

  # UPDATE 'U'

    def update()
      sql = "UPDATE books
      SET
      (
        title,
        author_id,
        genre_id
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@title, @author_id, @genre_id]
      SqlRunner.run( sql, values )
    end

  # DELETE 'D'

    def delete()
      sql = "DELETE FROM books
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all
      sql = "DELETE FROM books"
      SqlRunner.run( sql )
    end


# Below helps call names/titles rather than id's
  def author()
    sql = "SELECT * FROM authors
    WHERE id = $1"
    values = [@author_id]
    results = SqlRunner.run( sql, values )
    return Author.new( results.first )
  end

  def genre()
    sql = "SELECT * FROM genres
    WHERE id = $1"
    values = [@genre_id]
    results = SqlRunner.run( sql, values )
    return Genre.new( results.first )
  end

end
