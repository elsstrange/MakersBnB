class MakersBnb < Sinatra::Base
  post '/users' do   
    redirect '/users/new' if bad_sign_up?(params)
    
    user = User.new(username: params[:username], email: params[:email])
    user.password = params[:password]
    user.save!
    session[:user_id] = user.id
    redirect '/'
  end
  
  get '/users/new' do
    redirect '/' if session[:user_id]
    erb :users_new
  end
  
  def bad_sign_up?(params)
    if params[:password] != params[:'password confirmation']
      flash.next[:error] = ERRORS[:sign_up][:password_mismatch]
      return true
    elsif User.exists?(username: params[:username])
      flash.next[:error] = ERRORS[:sign_up][:duplicate_username]
      return true
    elsif User.exists?(email: params[:email])
      flash.next[:error] = ERRORS[:sign_up][:duplicate_email]
      return true
    end
  end
end
