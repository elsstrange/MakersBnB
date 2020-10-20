feature 'existing user signing in' do
  let(:username) { 'Test' }
  let(:wrong_username) { 'test' }
  let(:email) { 'makersbnb@example.com' }
  let(:password) { 'some_password' }
  let(:wrong_password) { 'wrong password' }
  let!(:user) { User.new(username: username, email: email) }
  
  before do
    user.password = password
    user.save!
  end

  scenario 'user has valid credentials' do
    visit '/'
    click_on 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: password
    click_button 'Log In'
    expect(current_path).to eq '/'
    expect(page).to have_content "Welcome, #{user.username}"
    expect(page).not_to have_link('Sign Up', href: '/users/new')
    expect(page).not_to have_link('Log In', href: '/sessions/new')
  end

  scenario 'user has invalid password credentials' do
    visit '/'
    click_on 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: wrong_password
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Log in failed. Check your details and try again."
    expect(page).to have_button('Log In')
  end

  scenario 'user has invalid username credentials' do
    visit '/'
    click_on 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in 'username', with: wrong_username
    fill_in 'password', with: password
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Log in failed. Check your details and try again."
    expect(page).to have_button('Log In')
  end
end
