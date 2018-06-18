require_relative( '../db/sql_runner' )

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



# DELETE 'D'

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end


end
