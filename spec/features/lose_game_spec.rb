feature 'Lose' do
  scenario 'player loses a game if they reach 0HP first and a message is displayed.' do
    exchange_attacks = 11
    sign_in_and_play
    exchange_attacks.times { attack_and_confirm }
    save_and_open_page
    expect(page).to have_content 'Mittens loses!'
  end
end
