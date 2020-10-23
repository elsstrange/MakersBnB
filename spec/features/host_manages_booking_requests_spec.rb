feature 'viewing booking requests for spaces' do
  let(:password) { 'password' }
  let!(:host) { create(:host, set_password: password) }

  let!(:space1) { create(:space, name: 'Space 1', host_id: host.id) }
  let!(:space2) { create(:space, name: 'Space 2', host_id: host.id) }
  
  let!(:guest) { create(:guest) }
  let!(:pending_booking) { create(:pending_booking, space_id: space1.id, guest_id: guest.id) }
  let!(:confirmed_booking) { create(:confirmed_booking, advance_date: 2, space_id: space2.id, guest_id: guest.id) }
  let!(:rejected_booking) { create(:rejected_booking, advance_date: 3, space_id: space2.id, guest_id: guest.id) }
  
  scenario 'a host reviews the booking requests they have received for their spaces' do
    visit '/'
    click_on 'Log In'
    fill_in 'username', with: host.username
    fill_in 'password', with: password
    click_button 'Log In'
    click_on 'Bookings'

    expect(current_path).to eq '/bookings'
    # save_and_open_page
    within("section.host-space#space#{space1.id}") do
      expect(page).to have_content space1.name
      expect(page).to have_content pending_booking.date.strftime('%d/%m/%Y')
      expect(page).to have_content "Request from #{guest.username}"
      expect(page).to have_content 'Pending'
    end
    within("section.host-space#space#{space2.id}") do
      expect(page).to have_content space2.name
      
      within("article#spacebooking#{confirmed_booking.id}") do
        expect(page).to have_content confirmed_booking.date.strftime('%d/%m/%Y')
        expect(page).to have_content "Request from #{guest.username}"
        expect(page).to have_content 'Confirmed'
      end
      within("article#spacebooking#{rejected_booking.id}") do
        expect(page).to have_content rejected_booking.date.strftime('%d/%m/%Y')
        expect(page).to have_content "Request from #{guest.username}"
        expect(page).to have_content 'Rejected'
      end
    end
  end
end
