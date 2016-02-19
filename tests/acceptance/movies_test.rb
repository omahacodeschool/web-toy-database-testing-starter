require 'test_helper'

class MoviesTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  # The actual tests go below this comment.

  def setup
    super
    
    @david_lean = Director.new
    @david_lean.name = "David Lean"
    @david_lean.save

    @m1 = Movie.new
    @m1.title = "Dr. Zhivago"
    @m1.director_id = @david_lean.id
    @m1.save
  end

  def test_hello_world
    get '/movies'

    assert(last_response.ok?)

    assert_includes(last_response.body, "Dr. Zhivago")
  end
end