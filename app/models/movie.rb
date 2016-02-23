class Movie < ActiveRecord::Base

  def get_errors
    return @errors
  end

  def set_errors
    @errors = []

    if self.title == ""
      @errors << "Title cannot be blank"
    end

    if self.director_id == nil
      @errors << "Must choose a director"
    end
  end

  # Checks if the record is valid.
  # 
  # Returns Boolean.
  def is_valid
    self.set_errors

    if @errors.length > 0
      return false
    else
      return true
    end
  end

  # Set a movie's actors.
  # 
  # arr_of_actor_ids - Array of actor IDs.
  # 
  # Return Nil.
  def set_actors(arr_of_actor_ids)
    Performance.where("movie_id" => self.id).delete_all

    arr_of_actor_ids.each do |actor_id|
      performance_row = Performance.new
      performance_row.actor_id = actor_id
      performance_row.movie_id = self.id
      performance_row.save
    end

    return nil
  end

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