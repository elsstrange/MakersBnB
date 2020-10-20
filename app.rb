require 'rack'
require 'sinatra/base'
require 'sinatra/activerecord'

require_relative 'models/user'

class MakersBnb < Sinatra::Base
  # register Sinatra::ActiveRecordsExtension
  enable :sessions

  get '/' do
    @user = User.find_by(id: session[:user_id])
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
end
