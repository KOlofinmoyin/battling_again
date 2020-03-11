class Game
  attr_reader :players, :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = @players.first
  end

  def attack(player)
    player.receive_damage
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

  def opponent_of(player)
    player == players.first ? players.last : players.first
  end
end
