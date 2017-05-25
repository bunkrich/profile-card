get '/bumblebees' do
  @bumblebees = Bumblebee.all
  erb :'/bumblebees/index'
end