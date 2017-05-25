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
  user_code = @user.google_sheets_code
  user_code = URI.parse(user_code).path.split('/')
  @user.google_sheets_code = user_code[3]
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.messages
    erb :'users/new'
  end
end

#####################################
# post '/users/show' do
#   user_input_id = params["code"]
#   @spreadsheet_id = user_input_id
#   initialize_google_api
#   erb :'users/show'
# end
######################################

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @spreadsheet_id = @user.google_sheets_code
  initialize_google_api
  puts @spreadsheet_id
    erb :'users/show'
end

get '/logout' do
  session.clear
  redirect '/'
end
