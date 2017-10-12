require_relative './player'

class Game

  attr_reader :player_1, :player_2

  def initialize(players)
    @player_1 = players[:player_1]
    @player_2 = players[:player_2]
  end

  def attack(player)
    player.take_hit
  end

end