feature 'Attack' do
  scenario 'Player 2 is attacked' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content('Dave attacked Mittens')
  end

  scenario 'Player 1 is attacked' do
    sign_in_and_play
    click_button 'Attack'
    click_link 'Ok'
    click_button 'Attack'
    expect(page).to have_content('Mittens attacked Dave')
  end

  scenario 'Player 2 wants attack' do
    sign_in_and_play
    click_button 'Attack'
    click_on 'Ok'
    expect(page).not_to have_content('Dave\'s turn')
    expect(page).to have_content('Mittens\'s turn')
  end

  scenario 'Player 1 wants attack' do
    sign_in_and_play
    expect(page).not_to have_content('Mittens\'s turn')
    expect(page).to have_content('Dave\'s turn')
  end

  scenario 'Player 1 attacks Player2, then Player2 hits Player1 and turn reverts to Player1' do
    sign_in_and_play
    click_button 'Attack'
    click_on 'Ok'
    click_button 'Attack'
    click_on 'Ok'
    expect(page).not_to have_content('Mittens\'s turn')
    expect(page).to have_content('Dave\'s turn')
  end
end
