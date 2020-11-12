require_relative 'action_mixins/change_stats_mixin'
require 'yaml'

class Work
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
    stats_config = YAML.safe_load(File.read('lib/action_config.yml'))['work']
    @fun = stats_config['fun']
    @mana = stats_config['mana']
    @fatigue = stats_config['fatigue']
    @money = stats_config['money']
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '-', @fun
    @stats['mana'] = take_op 'mana', '-', @mana
    @stats['money'] = take_op 'money', '+', @money
    @stats['fatigue'] = take_op 'fatigue', '+', @fatigue

    @stats
  end

  def self.perhaps?(current_stats)
    current_stats['state?']['1'] =
      current_stats['mana'] < 50 && current_stats['fatigue'] < 10
  end

  def self.print_info(numb, stats)
    puts "#{numb}: Go to work" + (perhaps?(stats) ? '' : ' (can\'t)')
  end
end
