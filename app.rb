require 'rack'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'

require_relative 'models/user'
require_relative 'models/space'

ERRORS = {
  :login => 'Log in failed. Check your details and try again.'
}

class MakersBnb < Sinatra::Base
  # register Sinatra::ActiveRecordsExtension
  register Sinatra::Flash
  enable :sessions, :method_override

  get '/' do
    @user = User.find_by(id: session[:user_id])
    @spaces = Space.all
    erb :index
  end

  get '/users/new' do
    erb :users_new
  end

  post '/users' do
    user = User.new(username: params[:username], email: params[:email])
    user.password = params[:password]
    user.save!
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :sessions_new
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:error] = ERRORS[:login]
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces' do
    space = Space.new(name: params[:name], description: params[:description], price: params[:price], host_id: session[:user_id])
    space.save!
    redirect '/'
  end
end
