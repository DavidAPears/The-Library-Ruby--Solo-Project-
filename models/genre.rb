require_relative( '../db/sql_runner' )

class Genre

  attr_reader( :id, :genre )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO genres
    (
      genre
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@genre]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end



end
