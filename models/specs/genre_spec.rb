require("minitest/autorun")
require_relative("../genre")

class TestGenre < MiniTest::Test

  def setup
    options = {"id" => 1, "genre" => "Historical Fiction" }

    @genre = Genre.new(options)
  end

# TEST(S)

  def test_genre()
    result = @genre.genre()
    assert_equal("Historical Fiction", result)
  end


end
