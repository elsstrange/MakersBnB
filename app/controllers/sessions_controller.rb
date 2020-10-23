class MakersBnb < Sinatra::Base
  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.next[:error] = ERRORS[:login]
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end

  get '/sessions/new' do
    erb :sessions_new
  end
end
