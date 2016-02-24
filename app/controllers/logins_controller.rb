MyApp.get "/logins/new" do
  # Show a form that lets a person create a new Login.
  erb :"logins/new"
end

MyApp.post "/logins/create" do
  # Process the form to log a person in.
end