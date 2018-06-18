require_relative( '../db/sql_runner' )

class Book

  attr_reader( :id, :title, :author, :genre_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @author = options['author']
    @genre_id = options['genre_id'].to_i
  end

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
    values = [@title, @author, @genre_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
