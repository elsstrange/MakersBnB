class MakersBnb < Sinatra::Base
  get '/' do
    @user = User.find_by(id: session[:user_id])
    @spaces = Space.all
    erb :index
  end
end
