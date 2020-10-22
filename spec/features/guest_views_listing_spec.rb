feature 'a prospective guest views listings' do
  let!(:space1) { create(:space) }
  let!(:space2) { create(:space, name: 'A leaky shed with a view', description: BetterLorem.w(100, true, true), price: 15) }
  
  scenario 'user is not logged in, views multiple listings but cannot book' do
    visit '/'
    expect(page).to have_content space1.name
    expect(page).to have_content space1.description[0..49].rstrip
    expect(page).to have_content "£#{space1.price} per night"
    expect(page).to have_content space2.name
    expect(page).to have_content space2.description[0..49].rstrip
    expect(page).to have_content "£#{space2.price} per night"

    within("article#space#{space1.id}") do
      click_on 'more-info'
    end
    expect(current_path).to eq "/spaces/#{space1.id}"
    expect(page).to have_content space1.name
    expect(page).to have_content space1.description
    expect(page).to have_content "£#{space1.price} per night"
    expect(page).not_to have_button 'Request Booking'
    
    click_on 'Spaces'
    expect(current_path).to eq '/'

    within("article#space#{space2.id}") do
      click_on 'more-info'
    end
    expect(current_path).to eq "/spaces/#{space2.id}"
    expect(page).to have_content space2.name
    expect(page).to have_content space2.description
    expect(page).to have_content "£#{space2.price} per night"
    expect(page).not_to have_button 'Request Booking'
  end

  scenario 'guest logs in, views a listing and can book' do
    log_in(:guest)
    within("article#space#{space1.id}") do
      click_on 'more-info'
    end
    expect(current_path).to eq "/spaces/#{space1.id}"
    expect(page).to have_content space1.name
    expect(page).to have_content space1.description
    expect(page).to have_content "£#{space1.price} per night"
    expect(page).to have_button 'Request Booking'
  end
end
