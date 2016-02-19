class Movie < ActiveRecord::Base

  # Get this movie's actors.
  # 
  # Returns a Relation (similar to an Array) of Actor objects.
  def actors
    this_movies_performances = Performance.where("movie_id" => self.id)

    this_movies_actors_ids = []
    this_movies_performances.each do |performance|
      this_movies_actors_ids << performance.actor_id
    end

    Actor.where("id" => this_movies_actors_ids)
  end

  # Get this movie's director.
  # 
  # Returns a Director object.
  def director
    Director.find_by_id(self.director_id)
  end
end