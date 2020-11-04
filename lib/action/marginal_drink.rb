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
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def self.there_is_possibility?(current_stats)
    current_stats['state?']['6'] = current_stats['money'] >= 150
  end

  def self.print_info(numb, stats)
    print "#{numb}: Drink with marginalized personalities"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
