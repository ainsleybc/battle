class Player

  attr_reader :name, :hit_points

  DEFAULT_DAMAGE = 10
  DEFAULT_HIT_POINTS = 100

  def initialize(name, hp = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hp
  end

  def take_hit
    @hit_points -= DEFAULT_DAMAGE
  end

  def dead?
    hit_points <= 0
  end

end
