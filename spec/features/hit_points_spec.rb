feature 'Player hit Points' do
  scenario 'displays Player 2\'s Hit Points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end

  scenario 'reduce Player 2\'s HP' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content('Mittens: 60HP')
    expect(page).to have_content('Mittens: 50HP')
  end
end
