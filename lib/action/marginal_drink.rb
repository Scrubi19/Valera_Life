class MarginalDrink
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] += 5
    @stats['health'] -= 80
    @stats['mana'] += 90
    @stats['fatigue'] += 80
    @stats['money'] -= 150

    @stats
  end

  def dead?
    @base_object.dead?
  end
end
