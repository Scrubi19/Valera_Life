require_relative 'action_mixins/change_stats_mixin'

class Work
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '-', 5
    @stats['mana'] = take_op 'mana', '-', 30
    @stats['money'] = take_op 'money', '+', 100
    @stats['fatigue'] = take_op 'fatigue', '+', 70

    @stats
  end

  def self.there_is_possibility?(current_stats)
    current_stats['state?']['1'] =
      current_stats['mana'] < 50 && current_stats['fatigue'] < 10
  end

  def self.print_info(numb, stats)
    print "#{numb}: Go to work"
    if there_is_possibility?(stats)
      puts ' (Can) '
    else
      puts ' (No possibility) '
    end
  end
end
