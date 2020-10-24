feature 'new user signing up' do
  let(:username) { 'Test' }
  let(:email) { 'makersbnb@example.com' }
  let(:password) { 'some_password' }
  let(:other_password) { 'some_other_password' }
  
  scenario 'user has valid new sign up details' do
    visit '/'
    click_on 'Sign Up'
    expect(current_path).to eq '/users/new'
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password confirmation', with: password
    click_button 'Sign Up'
    expect(current_path).to eq '/'
    expect(page).to have_content "Welcome, #{username}"
    expect(page).not_to have_link('Sign Up', href: '/users/new')
    expect(page).not_to have_link('Log In', href: '/sessions/new')
  end

  scenario 'user has mismatching passwords' do
    visit '/'
    click_on 'Sign Up'
    expect(current_path).to eq '/users/new'
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password confirmation', with: other_password
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Sign up failed: Passwords must match'
    expect(page).not_to have_button('Log Out')
  end


  feature 'preventing duplicate sign-ups' do
    let!(:persistent_user) { create(:user, username: username, email: email) }
    let(:new_username) { 'NewTest' }
    let(:new_email) { 'newmakersbnb@example.com' }
  
    scenario 'user tries username that already exists' do     
      visit '/'
      click_on 'Sign Up'
      expect(current_path).to eq '/users/new'
      fill_in 'username', with: username
      fill_in 'email', with: new_email
      fill_in 'password', with: password
      fill_in 'password confirmation', with: password
      click_button 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content 'Sign up failed: Username is already registered'
      expect(page).not_to have_button('Log Out')
    end

    scenario 'user tries email that already exists' do
      visit '/'
      click_on 'Sign Up'
      expect(current_path).to eq '/users/new'
      fill_in 'username', with: new_username
      fill_in 'email', with: email
      fill_in 'password', with: password
      fill_in 'password confirmation', with: password
      click_button 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content 'Sign up failed: Email is already registered'
      expect(page).not_to have_button('Log Out')
    end
  end
end

