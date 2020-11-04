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

  def dead?
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def self.there_is_possibility?(current_stats)
    current_stats['state?']['4'] = current_stats['money'] >= 100
  end

  def self.print_info(numb, stats)
    print "#{numb}: Go to a bar"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
