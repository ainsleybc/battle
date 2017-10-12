require_relative './player'

class Game

  attr_reader :player_1, :player_2

  def initialize(players_input)
    @player_1 = players_input[:player_1]
    @player_2 = players_input[:player_2]
    @players = [@player_1, @player_2]
  end

  def attack(player)
    player.take_hit
  end

  def receiver
    @players.last
  end

  def attacker
    @players.first
  end

  def switch_turn
    players.reverse!
  end

  def ended?
    player_1.dead? || player_2.dead?
  end

  private

  attr_reader :players

end
