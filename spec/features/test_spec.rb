feature 'page visit' do
  scenario 'testing' do
    visit '/test'
    expect(page).to have_content "Test infrastructure working"
  end
end
