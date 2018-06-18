require("minitest/autorun")
require_relative("../book")


class TestBook < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "The Great Gatsby", "author" => "F Scott Fitzgerald",
      "genre_id" => "$1" }

    @book = Book.new(options)
  end

# TESTS

  def test_title()
    result = @book.title()
    assert_equal("The Great Gatsby", result)
  end

  def test_author()
    result = @book.author()
    assert_equal("F Scott Fitzgerald", result)
  end

  def test_genre()
    result = @book.genre_id()
    assert_equal("$1", result)
  end



end
