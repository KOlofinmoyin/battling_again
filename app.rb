require 'sinatra/base'
require './lib/game'
require './lib/player'
require './lib/attack'


class Battling_again < Sinatra::Base
  enable :sessions
  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  post '/attack' do
    Attack.run(@game.opponent_of(@game.current_turn))
      if @game.game_over?
        redirect '/game-over'
      else
        redirect '/attack'
      end
  end

  get '/attack' do
    # @game = $game
    erb :attack
  end

  post '/switch-turn' do
    @game.switch_turn
    redirect('/play')
  end

  get '/game-over' do
    # @game = $game
    erb :game_over
  end

  run! if app_file == $0
end
