MyApp.before "/movies*" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user == nil
    redirect "/logins/new"
  end
end

MyApp.get "/movies/new" do
  @directors = Director.all
  @actors = Actor.all
  erb :"movies/new"
end

MyApp.get "/movies/:id/edit" do
  @movie = Movie.find_by_id(params[:id])
  @directors = Director.all
  @actors = Actor.all

  erb :"movies/edit"
end

MyApp.post "/movies/:id/update" do
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

MyApp.post "/movies/create" do
  @movie = Movie.new
  @movie.title = params["movie_title"]
  @movie.director_id = params["movie_director"]

  if @movie.is_valid == true
    @movie.save

    @movie.set_actors(params["movie_actors"])

    redirect "/movies/#{@movie.id}"
  else
    # Return error message
    @directors = Director.all
    @actors = Actor.all

    erb :"movies/new"
  end
end

MyApp.get "/movies/:id" do
  @movie = Movie.find_by_id(params[:id])
  erb :"/movies/show"
end






