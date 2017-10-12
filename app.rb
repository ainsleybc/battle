require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions

get '/' do
  erb :index
end

post '/names' do
  $player_1 = Player.new(params[:player_1_name])
  $player_2 = Player.new(params[:player_2_name])
  redirect to '/play'
end

get '/play' do
  erb :play, { locals: { player_1_name: $player_1.name, player_2_name: $player_2.name,
    player_1_hp: $player_1.hit_points,   player_2_hp: $player_2.hit_points } }
end

get '/attack' do
  Game.new.attack($player_2)
  erb :attack, { locals: { player_1_name: $player_1.name, player_2_name: $player_2.name }}
end

  run! if app_file == $0
end
