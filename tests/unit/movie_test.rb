require 'test_helper'

class MovieTest < Minitest::Test
  def setup
    @star_wars = Movie.new
    @star_wars.title = "Star Wars"
    @star_wars.save

    @air_force_1 = Movie.new
    @air_force_1.title = "Air Force 1"
    @air_force_1.save

    @a1 = Actor.new
    @a1.name = "Harrison Ford"
    @a1.save

    @a2 = Actor.new
    @a2.name = "Carrie Fisher"
    @a2.save

    p1 = Performance.new
    p1.actor_id = @a1.id
    p1.movie_id = @star_wars.id
    p1.save

    p2 = Performance.new
    p2.actor_id = @a1.id
    p2.movie_id = @air_force_1.id
    p2.save

    p3 = Performance.new
    p3.actor_id = @a2.id
    p3.movie_id = @star_wars.id
    p3.save
  end

  def test_get_a_movies_actors
    assert_includes(@star_wars.actors, @a1)
    assert_includes(@star_wars.actors, @a2)
  end

  def test_exclude_actors_not_in_a_movie
    refute_includes(@air_force_1.actors, @a2)
  end  
end