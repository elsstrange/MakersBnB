class MakersBnb < Sinatra::Base
  get '/spaces' do
    redirect '/'
  end
  
  post '/spaces' do
    space = Space.new(name: params[:name], description: params[:description], price: params[:price], host_id: session[:user_id])
    space.save!
    redirect '/'
  end
  
  get '/spaces/new' do
    erb :spaces_new
  end

  get '/spaces/:id' do
    @space = Space.find_by(id: params[:id])
    erb :space
  end
end
