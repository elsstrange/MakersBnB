class MakersBnb < Sinatra::Base
  # register Sinatra::ActiveRecordsExtension
  set :root, File.dirname(File.expand_path('..', __FILE__))
  register Sinatra::Flash
  enable :sessions, :method_override

  before do
    @user = current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
