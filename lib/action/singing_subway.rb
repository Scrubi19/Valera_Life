class SingingSubway
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] += 1
    @stats['money'] += (@stats['mana'] > 40) && (@stats['mana'] < 70) ? 60 : 10
    @stats['mana'] += 10
    @stats['fatigue'] += 20

    @stats
  end

  def dead?
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def self.there_is_possibility?(_current_stats)
    true
  end

  def self.print_info(numb, stats)
    print "#{numb}: Sing in the subway"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
