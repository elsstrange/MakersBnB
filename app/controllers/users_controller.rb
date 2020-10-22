class MakersBnb < Sinatra::Base
  post '/users' do
    user = User.new(username: params[:username], email: params[:email])
    user.password = params[:password]
    user.save!
    session[:user_id] = user.id
    redirect '/'
  end
  
  get '/users/new' do
    erb :users_new
  end  
end
