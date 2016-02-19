require 'test_helper'

class DirectorTest < Minitest::Test
  def setup
    super
    
    @david_lean = Director.new
    @david_lean.name = "David Lean"
    @david_lean.save

    @katherine_bigelow = Director.new
    @katherine_bigelow.name = "Katherine Bigelow"
    @katherine_bigelow.save

    @m1 = Movie.new
    @m1.title = "Bridge on the River Kwai"
    @m1.director_id = @david_lean.id
    @m1.save

    @m2 = Movie.new
    @m2.title = "Dr. Zhivago"
    @m2.director_id = @david_lean.id
    @m2.save

    @m3 = Movie.new
    @m3.title = "Lawrence of Arabia"
    @m3.director_id = @david_lean.id
    @m3.save

    @m4 = Movie.new
    @m4.title = "Hurt Locker"
    @m4.director_id = @katherine_bigelow.id
    @m4.save
  end

  def test_get_a_directors_movies
    assert_includes(@david_lean.movies, @m1)
    assert_includes(@david_lean.movies, @m2)
    assert_includes(@david_lean.movies, @m3)
    refute_includes(@david_lean.movies, @m4)
  end
end