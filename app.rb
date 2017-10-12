require 'sinatra/base'
require './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions

get '/' do
  erb :index
end

post '/names' do
  player_1 = Player.new(params[:player_1_name])
  player_2 = Player.new(params[:player_2_name])
  $game = Game.new(player_1: player_1, player_2: player_2)
  redirect '/play'
end

get '/play' do
  erb :play, { locals: { game: $game } }
end

get '/attack' do
  $game.attack($game.receiver)
  erb :attack, { locals: { game: $game } }
end

get '/switch-turns' do
  $game.switch_turn
  redirect '/play'
end

  run! if app_file == $0

end
