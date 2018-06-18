require("minitest/autorun")
require_relative("../loan")
require_relative("../member")
require_relative("../book")

class TestLoan < MiniTest::Test

  def setup
    options = {"id" => 1, "member_id" => 1, "book_id" => 2,
      "loan_start_date" => Time, "loan_length" => 14, "book_returned" => false }

    @loan = Loan.new(options)
  end

# TESTS

  def test_member_id()
    result = @loan.member_id()
    assert_equal(1, result)
  end

  def test_book_id()
    result = @loan.book_id()
    assert_equal(2, result)
  end

  def test_loan_start_date()
    result = @loan.loan_start_date()
    assert_equal(Time, result)
  end

  def test_loan_length()
    result = @loan.loan_length()
    assert_equal(14, result)
  end

  def test_book_returned()
    result = @loan.book_returned()
    assert_equal(false, result)
  end



end
