require_relative './player'

class Game

  attr_reader :player1, :player2

  def initialize(players)
    @player1 = players[:player1]
    @player2 = players[:player2]
  end

  def attack(player)
    player.take_hit
  end

end