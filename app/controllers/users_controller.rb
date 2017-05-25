post '/users/show' do
  puts
user_input_id = params["code"]

  @spreadsheet_id = user_input_id
  initialize_google_api
  erb :'users/show'
end
