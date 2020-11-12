require_relative 'action_mixins/change_stats_mixin'
require 'yaml'

class MarginalDrink
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
    stats_config = YAML.safe_load(File.read('lib/action_config.yml'))['marginal_drink']
    @fun = stats_config['fun']
    @mana = stats_config['mana']
    @fatigue = stats_config['fatigue']
    @health = stats_config['health']
    @money = stats_config['money']
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

  def self.perhaps?(current_stats)
    current_stats['state?']['6'] = current_stats['money'] >= 150
  end

  def self.print_info(numb, stats)
    puts "#{numb}: Drink with marginal" + (perhaps?(stats) ? '' : ' (can\'t)')
  end
end
