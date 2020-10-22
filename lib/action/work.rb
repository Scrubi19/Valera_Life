class Work
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] -= 5
    @stats['mana'] -= @stats['mana'] <= 0 ? 0 : 30
    @stats['money'] += 100
    @stats['fatigue'] += 70

    @stats
  end

  def dead?
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def drunk?
    @stats['mana'] < 50 && @stats['fatigue'] < 10
  end

  def might?
    dead? && drunk?
  end
end
