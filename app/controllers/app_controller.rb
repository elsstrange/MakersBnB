class MakersBnb < Sinatra::Base
  # register Sinatra::ActiveRecordsExtension
  set :root, File.dirname(File.expand_path('..', __FILE__))
  register Sinatra::Flash
  enable :sessions, :method_override
end
