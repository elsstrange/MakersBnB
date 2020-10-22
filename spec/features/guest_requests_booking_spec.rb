feature 'requesting a booking' do
  let!(:space) { create(:space) }
  let(:date) { Date.today >> 3 }

  scenario 'a guest requests a booking for a space on a specific date' do
    log_in(:guest)
    click_on 'more-info'
    fill_in 'date', with: date.strftime('%Y-%m-%d')
    click_button 'Request Booking'
    expect(current_path).to eq '/'
    expect(page).to have_content "Your request to book #{space.name} on #{date.strftime('%d/%m/%Y')} has been received."
  end
end
