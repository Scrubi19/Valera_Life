require_relative 'action_mixins/change_stats_mixin'
require 'yaml'

class SingingSubway
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
    stats_config = YAML.safe_load(File.read('lib/action_config.yml'))['singing_subway']
    @fun = stats_config['fun']
    @mana = stats_config['mana']
    @fatigue = stats_config['fatigue']
    @money = stats_config['money']
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '+', @fun
    @stats['money'] = take_op 'money', '+', @money
    @stats['mana'] = take_op 'mana', '+', @mana
    @stats['fatigue'] = take_op 'fatigue', '+', @fatigue

    @stats
  end

  def self.perhaps?(current_stats)
    current_stats['state?']['5'] = true
  end

  def self.print_info(numb, stats)
    puts "#{numb}: Sing in the subway" + (perhaps?(stats) ? '' : ' (can\'t)')
  end
end
