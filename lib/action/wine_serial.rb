class WineSerial
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] -= 1
    @stats['mana'] += 30
    @stats['fatigue'] += 10
    @stats['health'] -= 5
    @stats['money'] -= 20

    @stats
  end

  def dead?
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def self.there_is_possibility?(current_stats)
    current_stats['money'] >= 20
  end

  def self.print_info(numb, stats)
    print "#{numb}: Drink wine and watch TV series"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
