feature 'viewing the status of booking requests' do
  let!(:space) { create(:space) }
  let(:password) { 'password' }
  let!(:guest) { create(:guest, set_password: password) }
  let!(:pending_booking) { create(:pending_booking, space_id: space.id, guest_id: guest.id) }
  let!(:confirmed_booking) { create(:confirmed_booking, advance_date: 2, space_id: space.id, guest_id: guest.id) }
  let!(:cancelled_booking) { create(:cancelled_booking, advance_date: 3, space_id: space.id, guest_id: guest.id) }

  scenario 'a guest checks the status of their booking requests' do
    visit '/'
    click_on 'Log In'
    fill_in 'username', with: guest.username
    fill_in 'password', with: password
    click_button 'Log In'
    click_on 'Bookings'
    expect(current_path).to eq '/bookings'
    within("article#guestbooking#{pending_booking.id}") do
      expect(page).to have_content space.name
      expect(page).to have_content pending_booking.date.strftime('%d/%m/%Y')
      expect(page).to have_content 'Pending'
    end
    within("article#guestbooking#{confirmed_booking.id}") do
      expect(page).to have_content space.name
      expect(page).to have_content confirmed_booking.date.strftime('%d/%m/%Y')
      expect(page).to have_content 'Confirmed'
    end
    within("article#guestbooking#{cancelled_booking.id}") do
      expect(page).to have_content space.name
      expect(page).to have_content cancelled_booking.date.strftime('%d/%m/%Y')
      expect(page).to have_content 'Cancelled'
    end
  end  
end
