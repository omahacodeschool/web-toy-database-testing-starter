class Director < ActiveRecord::Base

  # Get director's movies.
  # 
  # Returns a Relation (similar to an Array) of Movie objects.
  def movies
    Movie.where("director_id" => self.id)
  end
end