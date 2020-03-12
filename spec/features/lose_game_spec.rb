feature 'Lose' do
  scenario 'player loses a game if they reach 0HP first and a message is displayed.' do
    sign_in_and_play
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    click_on 'Ok'
    click_on 'Attack'
    save_and_open_page
    expect(page).to have_content 'Mittens loses!'
  end
end
