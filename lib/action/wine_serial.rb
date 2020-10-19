class WineSerial
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats.clone

    @stats['fun'] -= 1
    @stats['mana'] += 30
    @stats['fatigue'] += 10
    @stats['health'] -= 5
    @stats['money'] -= 20

    @stats
  end
end
