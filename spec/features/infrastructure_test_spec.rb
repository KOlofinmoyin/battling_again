feature 'Infrastructure Test' do
  scenario 'Navigate to homepage.' do
    visit('/')
    expect(page).to have_content('Prepare to do battle!')
  end

end
