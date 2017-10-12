require 'sinatra/base'
require './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions

get '/' do
  erb :index
end

post '/names' do
  $game = Game.new(player1: Player.new(params[:player_1_name]),player2: Player.new(params[:player_2_name]))
  redirect to '/play'
end

get '/play' do
  erb :play, { locals: { player_1_name: $game.player1.name, player_2_name: $game.player2.name,
    player_1_hp: $game.player1.hit_points,   player_2_hp: $game.player2.hit_points } }
end

get '/attack' do
  $game.attack($game.player2)
  erb :attack, { locals: { player_1_name: $game.player1.name, player_2_name: $game.player2.name }}
end

  run! if app_file == $0
end
