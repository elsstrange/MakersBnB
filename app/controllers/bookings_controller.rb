class MakersBnb < Sinatra::Base
  STATUSES = {
    :reject  => 'rejected',
    :confirm => 'confirmed',
  }
  
  get '/bookings' do
    @user = User.find_by(id: session[:user_id])
    @guest_bookings = Booking.where(guest_id: session[:user_id])
    erb :bookings
  end
  
  post '/bookings' do
    booking = Booking.create(date: params[:date], space_id: params[:space_id], guest_id: session[:user_id])
    space = Space.find_by(id: params[:space_id])
    flash.next[:acknowledgement] = "Your request to book #{space.name} on #{booking.date.strftime(DATE_FORMAT)} has been received."
    redirect '/'
  end

  patch '/bookings/:id' do
    Booking.find_by(id: params[:id]).update(status: params[:status])
    redirect '/bookings'
  end
end
