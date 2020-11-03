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

  def self.there_is_possibility?(current_stats)
    current_stats['mana'] < 50 && current_stats['fatigue'] < 10
  end

  # def might?
  #   dead? && drunk?
  # end

  def self.print_info(numb, stats)
    print "#{numb}: Go to work"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
