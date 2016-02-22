require 'test_helper'

class MovieTest < Minitest::Test
  def setup
    super
    
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

  def test_set_a_movies_actors
    # Setup
    @movie = Movie.new
    @movie.save

    actor_ids = [@a1.id, @a2.id]

    # Exercise
    @movie.set_actors(actor_ids)

    # Verify
    assert_includes(@movie.actors, @a1)
    assert_includes(@movie.actors, @a2)
  end

  def test_changing_a_movies_actors
    # Setup
    @movie = Movie.new
    @movie.save

    @a3 = Actor.new
    @a3.name = "Anthony Daniels"
    @a3.save

    x = Performance.new
    x.actor_id = @a1.id
    x.movie_id = @movie.id
    x.save

    new_actor_ids = [@a2.id, @a3.id]

    # Exercise
    @movie.set_actors(new_actor_ids)

    # Verify
    refute_includes(@movie.actors, @a1)
    assert_includes(@movie.actors, @a2)
    assert_includes(@movie.actors, @a3)
  end

  def test_get_a_movies_actors
    assert_includes(@star_wars.actors, @a1)
    assert_includes(@star_wars.actors, @a2)
  end

  def test_exclude_actors_not_in_a_movie
    refute_includes(@air_force_1.actors, @a2)
  end  
end