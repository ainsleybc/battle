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
    player_1_hp: 100,   player_2_hp: 100 } }
end

post '/attacked' do
  $player_2.take_hit
  erb :attacked, { locals: { player_1_name: $player_1.name, player_2_name: $player_2.name }}
end

  run! if app_file == $0
end
