class Sleep
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats.clone

    @stats['health'] += @stats['mana'] < 30 ? 90 : 0
    @stats['fun'] -= @stats['mana'] > 70 ? 3 : 0
    @stats['mana'] -= 50
    @stats['fatigue'] -= 70

    @stats
  end

  def dead?
    @base_object.dead?
  end
end
