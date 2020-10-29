class Attack
  def initialize(player)
    @player = player
  end

  def self.run(player)
    new(player).run
  end

  def run
    @player.damage(random_damage)
  end

  private
  def random_damage
    Kernel.rand(5..10)
  end
end
