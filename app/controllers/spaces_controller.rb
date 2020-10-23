class MakersBnb < Sinatra::Base
  get '/spaces' do
    redirect '/'
  end
  
  post '/spaces' do
    Space.create(
      name: params[:name],
      description: params[:description], 
      price: params[:price], 
      host_id: session[:user_id]
    )
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
