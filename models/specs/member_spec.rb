require("minitest/autorun")
require_relative("../member")


class TestMember < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "David", "last_name" => "Pears",
      "post_code" => "EH8 8EY", "email_address" => "davidapears@gmail.com", "active_membership" => true}

    @member = Member.new(options)
  end


  def test_first_name()
    result = @member.first_name()
    assert_equal("David", result)
  end

  def test_last_name()
    result = @member.last_name()
    assert_equal("Pears", result)
  end


  def test_post_code()
    result = @member.post_code()
    assert_equal("EH8 8EY", result)
  end

  def test_email_address()
    result = @member.email_address()
    assert_equal("davidapears@gmail.com", result)
  end

  def test_active_membership()
    result = @member.active_membership()
    assert_equal(true, result)
  end

  

end
