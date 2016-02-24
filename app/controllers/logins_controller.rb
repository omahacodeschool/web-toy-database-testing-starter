MyApp.get "/logins/delete" do
  session["user_id"] = nil

  erb :"logins/deleted"
end

MyApp.get "/logins/new" do
  # Show a form that lets a person create a new Login.
  erb :"logins/new"
end

MyApp.post "/logins/create" do
  # Process the form to log a person in.

  @user = User.find_by_email(params["email"])

  if @user.password == params["password"]
    session["user_id"] = @user.id

    erb :"logins/success"
  else
    erb :"logins/failed"
  end

  # 1. We need the user record.
  # 2. Check that what the user typed in now == the user record's password.

  # if the login is successful
  #   set the session variable that says WHOEVER is logged in
  # else
  #   say they failed to log in
  # end
end