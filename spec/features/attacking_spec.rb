feature 'Attack' do
  scenario 'Player 2 is attacked' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content('Dave attacked Mittens')
  end

  scenario 'Player 1 is attacked' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).to have_content('Mittens attacked Dave')
  end

  context 'when dealing set damage' do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
    end

      scenario 'reduce Player 2 HP by 10' do
        sign_in_and_play
        attack_and_confirm
        expect(page).not_to have_content('Mittens: 60HP')
        expect(page).to have_content('Mittens: 50HP')
      end
  end

  scenario 'Player 2\'s turn to attack' do
    sign_in_and_play
    attack_and_confirm
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
    2.times { attack_and_confirm }
    expect(page).not_to have_content('Mittens\'s turn')
    expect(page).to have_content('Dave\'s turn')
  end
end
