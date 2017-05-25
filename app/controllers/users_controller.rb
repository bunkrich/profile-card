

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Email and password do not match our records."]
    erb :'users/login'
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 400
    erb :'users/new'
  end
end

#####################################
post '/users/show' do
  user_input_id = params["code"]
  @spreadsheet_id = user_input_id
  initialize_google_api
  erb :'users/show'
end
######################################

get '/users/:id' do
  require_user
  @user = User.find_by(id: params[:id])
  if require_owner(@user.id)
    erb :'users/show'
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
