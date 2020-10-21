class Chill
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] -= 5
    @stats['mana'] -= @stats['mana'] <= 0 ? 0 : 10
    @stats['fatigue'] += 10

    @stats
  end

  def dead?
    @base_object.dead?
  end
end
