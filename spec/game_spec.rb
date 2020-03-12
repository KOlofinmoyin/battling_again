require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  subject(:finished_game) { described_class.new(dead_player, player_2) }
  let(:player_1) { double :player_1, hit_points: 60 }
  let(:player_2) { double :player_2, hit_points: 60 }
  let(:dead_player) { double :player, hit_points: 0 }

    describe '#player_1' do
      it 'retrieves the first player' do
        expect(game.player_1).to eq player_1
      end
    end

    describe '#player_2' do
      it 'retrieves the second player' do
        expect(game.player_2).to eq player_2
      end
    end

    describe '#switch_turn' do
      it "switches player turns" do
        game.switch_turn
        expect(game.current_turn).to eq player_2
      end
    end
  end

  describe '#game_over?' do
    it "returns false if no one is at 0HP" do
      expect(game.game_over?).to eq false
    end
  end
