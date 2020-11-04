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
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def self.there_is_possibility?(current_stats)
    current_stats['state?']['2'] = current_stats['money'] >= 20
  end

  def self.print_info(numb, stats)
    print "#{numb}: Contemplate nature"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
