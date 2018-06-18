require("minitest/autorun")
require_relative("../author")

class TestAuthor < MiniTest::Test

  def setup
    options = {"id" => 1, "author" => "F Scott Fitzgerald" }

    @author = Author.new(options)
  end

# TEST(S)

  def test_genre()
    result = @author.author()
    assert_equal("F Scott Fitzgerald", result)
  end


end
