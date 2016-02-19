MyApp.get "/movies" do
  @movies = Movie.all
  erb :"movies/list"
end