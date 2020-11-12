require_relative 'action_mixins/change_stats_mixin'
require 'yaml'

class GoBar
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
    stats_config = YAML.safe_load(File.read('lib/action_config.yml'))['go_bar']
    @fun = stats_config['fun']
    @mana = stats_config['mana']
    @fatigue = stats_config['fatigue']
    @health = stats_config['health']
    @money = stats_config['money']
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '+', @fun
    @stats['mana'] = take_op 'mana', '+', @mana
    @stats['fatigue'] = take_op 'fatigue', '+', @fatigue
    @stats['health'] = take_op 'health', '-', @health
    @stats['money'] = take_op 'money', '-', @money

    @stats
  end

  def self.perhaps?(current_stats)
    current_stats['state?']['4'] = current_stats['money'] >= 100
  end

  def self.print_info(numb, stats)
    puts "#{numb}: Go to a bar" + (perhaps?(stats) ? '' : ' (can\'t)')
  end
end
