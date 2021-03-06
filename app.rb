require 'sinatra/base'
require './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.current_game
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    Game.create_game(player_1: player_1, player_2: player_2)
    redirect '/play'
  end

  get '/play' do
    erb :play, { locals: { game: @game } }
  end

  get '/attack' do
    @game.attack(@game.receiver)
    erb :attack, { locals: { game: @game } }
  end

  get '/switch-turns' do
    @game.switch_turn
    @game.ended? ? redirect('/winner') : redirect('/play')
  end

  get '/winner' do
    erb :winner, { locals: { game: @game } }
  end

  run! if app_file == $0

end
