feature 'Game over' do
  context 'when player 1 reaches 0HP first' do
    before do
      sign_in_and_play
      2.times { attack_and_confirm }
      allow(Kernel).to receive(:rand).and_return(60)
    end

    scenario 'player 1 loses' do
      click_on 'Attack'
      expect(page).to have_content 'Dave loses!'
    end
  end
end
