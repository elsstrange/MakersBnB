require_relative './space'

class Booking < ActiveRecord::Base
  def space(space_class = Space)
    space_class.find_by(id: space_id)
  end
end
