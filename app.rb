require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

get '/' do
  "Testing infrastructure working!"
  erb :index
end

post '/names' do
  # player1 = params[:player_1]
  session[:player_1_name] = params[:player_1_name]
  session[:player_2_name] = params[:player_2_name]
  redirect to '/play'
end

get '/play' do
  erb :play, { locals: { player_1: session[:player_1_name], player_2: session[:player_2_name],
    player_1_hp: 100,   player_2_hp: 100 } }
end

  run! if app_file == $0
end
