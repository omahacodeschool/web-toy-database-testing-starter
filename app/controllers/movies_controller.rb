MyApp.get "/edit_movie/:id" do
  @movie = Movie.find_by_id(params[:id])
  @directors = Director.all
  @actors = Actor.all

  erb :"movies/edit"
end

MyApp.post "/update_movie/:id" do
  @movie = Movie.find_by_id(params[:id])

  @movie.title = params["movie_title"]
  @movie.director_id = params["movie_director"]

  @movie.save

  @movie.set_actors(params["movie_actors"])

  erb :"movies/created"
end

MyApp.get "/movies" do
  @movies = Movie.all
  erb :"movies/list"
end

MyApp.get "/new_movie" do
  @directors = Director.all
  @actors = Actor.all
  erb :"movies/new"
end

MyApp.post "/create_movie" do
  @movie = Movie.new
  @movie.title = params["movie_title"]
  @movie.director_id = params["movie_director"]

  if @movie.is_valid == true
    @movie.save

    @movie.set_actors(params["movie_actors"])

    erb :"movies/created"
  else
    # Return error message
    erb :"error"
  end
end








