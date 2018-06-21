require_relative( '../db/sql_runner' )
require('pry')

class Member

  attr_reader( :id, :first_name, :last_name, :post_code, :email_address, :active_membership )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @post_code = options['post_code']
    @email_address = options['email_address']
    @active_membership = options['active_membership']
  end

  def active?()
    @active_membership == 't' ? 'Yes' : 'No'
  end

  def deactivate?()
    @active_membership == 't' ? 'Yes' : 'No'
  end

  # def full_name()
  #   return "#{@first_name} #{@last_name}"
  # end

  # def initialize(full_name)
  #   @full_name = [@first_name, @last_name]
  # end

# CREATE 'C'

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      post_code,
      email_address,
      active_membership
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @post_code, @email_address, @active_membership]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

# INNER JOIN (Member & Books)

  def books
    sql = "SELECT books.* FROM books INNER JOIN loans ON loans.book_id = books.id WHERE member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Book.map_items(results)
  end

  def self.map_items(book_data)
    result = book_data.map { |book|
    Member.new( book ) }
    return result
  end

# READ 'R'

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

# UPDATE 'U'

def update()
  sql = "UPDATE members
  SET
  (
    first_name,
    last_name,
    post_code,
    email_address,
    active_membership
  ) =
  (
    $1, $2, $3, $4, $5
  )
  WHERE id = $6"
  values = [@first_name, @last_name, @post_code, @email_address, @active_membership, @id]
  SqlRunner.run( sql, values )
end


# DELETE 'D'

def delete()
  sql = "DELETE FROM members
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

def self.delete_all
  sql = "DELETE FROM members"
  SqlRunner.run( sql )
end

# Method to 'Deactive' membership...

# def deactivate()
#   sql = "UPDATE members SET ( active_membership ) = ( false ) WHERE id = $1"
#   values = [@id]
#   SqlRunner.run( sql, values )
# end

def deactivate()
  @active_membership = false
  update()
end

end
