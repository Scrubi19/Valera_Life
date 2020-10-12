class GoBar
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] += 1
    @stats['mana'] += 60
    @stats['fatigue'] += 40
    @stats['health'] -= 10
    @stats['money'] -= 100

    @stats
  end
end
