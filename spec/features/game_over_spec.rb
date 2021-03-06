feature 'Game over' do
  context 'when player 1 reaches 0HP first' do
    before do
      sign_in_and_play
      10.times {attack_and_confirm}
      allow(Kernel).to receive(:rand).and_return(60)
    end

    scenario 'Player 1 loses' do
      click_button 'Attack'
      expect(page).to have_content 'Mittens loses!'
    end
  end
end
