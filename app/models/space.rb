require_relative './booking'

class Space < ActiveRecord::Base
  def short_description(length)
    description[0..(length - 1)]
  end

  def bookings(booking_class = Booking)
    booking_class.where(space_id: id)
  end
end
