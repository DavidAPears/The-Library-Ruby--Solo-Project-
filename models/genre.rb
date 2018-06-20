require_relative( '../db/sql_runner' )

class Genre

  attr_reader( :id )
  attr_accessor( :genre)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @genre = options['genre']
  end



# CREATE 'C'

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

  # READ 'R'

  def self.all()
    sql = "SELECT * FROM genres"
    results = SqlRunner.run( sql )
    return results.map { |genre| Genre.new( genre ) }
  end

  def self.find( id )
    sql = "SELECT * FROM genres
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Genre.new( results.first )
  end

  # UPDATE 'U'

  def update()
    sql = "UPDATE genres SET genre = $1 WHERE id = $2"
    values = [@genre, @id]
    SqlRunner.run( sql, values )
  end


  # DELETE 'D'

  def delete()
    sql = "DELETE FROM genres
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM genres"
    SqlRunner.run( sql )
  end


end
