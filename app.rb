require 'sinatra/base'
require_relative 'lib/game'
require_relative 'lib/player'


class Battling_again < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @player = @game.current_turn
    @opponent = @game.opponent_of(@player)
    @game.attack(@game.player_2)
    @game.switch_turn
    erb :attack
  end

  run! if app_file == $0
end
