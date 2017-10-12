class Player

  attr_reader :name, :hit_points

  DEFAULT_DAMAGE = 10
  DEFAULT_HIT_POINTS = 100

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def take_hit
    @hit_points -= DEFAULT_DAMAGE
  end

  def attack(player2)
    player2.take_hit
  end

end
