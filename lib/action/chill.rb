class Chill
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats.clone

    @stats['fun'] -= 5
    @stats['mana'] -= 10
    @stats['fatigue'] += 10

    @stats
  end
end
