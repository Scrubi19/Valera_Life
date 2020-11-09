require_relative 'action_mixins/change_stats_mixin'

class GoBar
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '+', 1
    @stats['mana'] = take_op 'mana', '+', 60
    @stats['fatigue'] = take_op 'fatigue', '+', 40
    @stats['health'] = take_op 'health', '-', 10
    @stats['money'] = take_op 'money', '-', 100

    @stats
  end

  def self.perhaps?(current_stats)
    current_stats['state?']['4'] = current_stats['money'] >= 100
  end

  def self.print_info(numb, stats)
    puts "#{numb}: Go to a bar" + (perhaps?(stats) ? '' : ' (can\'t)')
  end
end
