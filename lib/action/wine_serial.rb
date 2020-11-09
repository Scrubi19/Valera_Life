require_relative 'action_mixins/change_stats_mixin'

class WineSerial
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '-', 1
    @stats['mana'] = take_op 'mana', '+', 30
    @stats['fatigue'] = take_op 'fatigue', '+', 10
    @stats['health'] = take_op 'health', '-', 5
    @stats['money'] = take_op 'money', '-', 20

    @stats
  end

  def self.perhaps?(current_stats)
    current_stats['state?']['3'] = current_stats['money'] >= 20
  end

  def self.print_info(numb, stats)
    puts "#{numb}: Drink wine, watch TV" + (perhaps?(stats) ? '' : ' (can\'t)')
  end
end
