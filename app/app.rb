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
  :login => 'Log in failed. Check your details and try again.',
  :sign_up => {
    :duplicate_username => 'Sign up failed: Username is already registered',
    :duplicate_email => 'Sign up failed: Email is already registered',
    :password_mismatch => 'Sign up failed: Passwords must match'
  }
}

DATE_FORMAT = '%d/%m/%Y'
