require 'rack'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'

require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/booking'

require_relative 'controllers/app_controller'
require_relative 'controllers/home_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/spaces_controller'
require_relative 'controllers/bookings_controller'

ERRORS = {
  :login => 'Log in failed. Check your details and try again.'
}

DATE_FORMAT = '%d/%m/%Y'
