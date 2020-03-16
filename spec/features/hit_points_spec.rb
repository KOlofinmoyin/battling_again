feature 'Player hit Points' do
  scenario 'displays Player 2\'s Hit Points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end

  scenario 'displays Player 1\'s Hit Points' do
    sign_in_and_play
    expect(page).to have_content 'Dave: 60HP'
  end

  scenario 'reduce Player 2\'s HP by 10' do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content('Mittens: 60HP')
    expect(page).to have_content('Mittens: 50HP')
  end

  scenario 'reduce Player 1\'s HP by 10' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).not_to have_content('Dave: 60HP')
    expect(page).to have_content('Dave: 50HP')
  end
end
