feature 'adding a listing' do
  let(:name) { 'A lovely room with a view' }
  let(:description) { BetterLorem.w(100, true, true) }
  let(:price) { '50' }
    
  scenario 'host adds listing' do
    log_in(:host)
    click_button 'List a Space'
    expect(current_path).to eq '/spaces/new'
    fill_in 'name', with: name
    fill_in 'description', with: description
    fill_in 'price', with: price
    click_button 'List my Space'
    expect(current_path).to eq '/'
    expect(page).to have_content name
    expect(page).to have_content description[0..49].rstrip
    expect(page).not_to have_content description[50..-1]
    expect(page).to have_content price
  end
end
