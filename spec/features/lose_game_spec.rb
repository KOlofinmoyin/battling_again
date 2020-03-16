feature 'Lose' do
  scenario 'player loses a game if they reach 0HP first and a message is displayed.' do
    exchange_attacks = 10
    sign_in_and_play
    exchange_attacks.times { attack_and_confirm }
    click_on 'Attack'
    expect(page).to have_content 'Mittens loses!'
  end
end
