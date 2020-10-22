class MakersBnb < Sinatra::Base
  post '/bookings' do
    booking = Booking.create(date: params[:date], space_id: params[:space_id], guest_id: session[:user_id])
    space = Space.find_by(id: params[:space_id])
    flash.next[:acknowledgement] = "Your request to book #{space.name} on #{booking.date.strftime(DATE_FORMAT)} has been received."
    redirect '/'
  end
end
