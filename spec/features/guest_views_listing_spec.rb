feature 'a prospective guest views listings' do
  let!(:space1) { create(:space) }
  let!(:space2) { create(:space, name: 'A leaky shed with a view', description: BetterLorem.w(100, true, true), price: 15) }
  
  scenario 'user is not logged in, views multiple listings' do
    visit '/'
    expect(page).to have_content space1.name
    expect(page).to have_content space1.description[0..49].chomp
    expect(page).to have_content "£#{space1.price} per night"
    expect(page).to have_content space2.name
    expect(page).to have_content space2.description[0..49].chomp
    expect(page).to have_content "£#{space2.price} per night"

    within("article#space#{space1.id}") do
      click_on 'more-info'
    end
    expect(page).to have_content space1.name
    expect(page).to have_content space1.description
    expect(page).to have_content "£#{space1.price} per night"
    
    click_on 'Spaces'
    expect(current_path).to eq '/'

    within("article#space#{space2.id}") do
      click_on 'more-info'
    end
    expect(page).to have_content space2.name
    expect(page).to have_content space2.description
    expect(page).to have_content "£#{space2.price} per night"
  end
end
