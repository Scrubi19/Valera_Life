class Sleep
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['health'] += @stats['mana'] < 30 ? 90 : 0
    @stats['fun'] -= @stats['mana'] > 70 ? 3 : 0
    @stats['mana'] -= @stats['mana'] <= 0 ? 0 : 50
    @stats['fatigue'] -= @stats['fatigue'] <= 0 ? 0 : 70

    @stats
  end

  def dead?
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def self.there_is_possibility?(current_stats)
    current_stats['state?']['7'] = true
  end

  def self.print_info(numb, stats)
    print "#{numb}: Sleep"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
