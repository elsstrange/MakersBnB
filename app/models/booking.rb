require_relative './space'
require_relative './user'

class Booking < ActiveRecord::Base
  def space(space_class = Space)
    space_class.find_by(id: space_id)
  end
  
  def guest(user_class = User)
    user_class.find_by(id: guest_id)
  end
end
