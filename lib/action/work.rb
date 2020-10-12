class Work
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] -= 5
    @stats['mana'] -= 30
    @stats['money'] += 100
    @stats['fatigue'] += 70

    @stats
  end
end
