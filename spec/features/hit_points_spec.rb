feature 'Player hit Points' do
  scenario 'displays Player 2\'s Hit Points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end
end
