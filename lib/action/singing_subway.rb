require_relative 'action_mixins/change_stats_mixin'

class SingingSubway
  include ChangeStatsMixin
  attr_accessor :base_object

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['fun'] = take_op 'fun', '+', 1
    @stats['money'] = take_op 'money', '+', 10
    @stats['mana'] = take_op 'mana', '+', 10
    @stats['fatigue'] = take_op 'fatigue', '+', 20

    @stats
  end

  # def dead?
  #   (@stats['fun'] <= -10) || (@stats['health']).negative?
  # end

  def self.there_is_possibility?(current_stats)
    current_stats['state?']['5'] = true
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
