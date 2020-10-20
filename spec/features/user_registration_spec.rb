feature 'new user signing up' do
  let(:username) { 'Test' }
  let(:email) { 'makersbnb@example.com' }
  let(:password) { 'some_password' }
  
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
end
