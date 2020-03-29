class Game
  attr_reader :players, :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = @players.first
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_turn
    @current_turn = opponent_of(@current_turn)
  end

  def game_over?
    losing_players.any?
  end

  def loser
    losing_players.first
  end

  class << self
    def create(player_1, player_2)
      @game = Game.new(player_1, player_2)
    end

    def instance
      @game
    end
  end
  # # private
  # attr_reader :players

  def opponent_of(player)
    player == players.first ? @players.last : @players.first
  end

  def losing_players
    @players.select { |player| player.hit_points <= 0 }
  end
end
