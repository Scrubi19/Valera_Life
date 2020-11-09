require_relative 'action_mixins/change_stats_mixin'

class MarginalDrink
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '+', 5
    @stats['health'] = take_op 'health', '-', 80
    @stats['mana'] = take_op 'mana', '+', 80
    @stats['fatigue'] = take_op 'fatigue', '+', 80
    @stats['money'] = take_op 'money', '-', 150

    @stats
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
