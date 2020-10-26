require_relative '../saves_system/to_json'
require_relative '../valera'
require_relative '../action/sleep'
require_relative '../action/chill'
require_relative '../action/wine_serial'
require_relative '../action/work'
require_relative '../action/singing_subway'
require_relative '../action/go_bar'
require_relative '../action/marginal_drink'
require_relative '../saves_system/from_json'
require_relative '../action/modification_mixin'

class NextStep
  include ModificationMixin
  def get_step(valera)
    puts '1 Work'
    puts '2 Chill'
    puts '3 Wine'
    puts '4 Go bar'
    puts '5 Drink'
    puts '6 Singing'
    puts '7 Sleep'

    print 'choose an action: '
    choose = $stdin.gets.strip

    checker = check_pos_effect(choose.to_s, valera)
    return checker if checker != self

    checker.check_neg_effect(choose.to_s, valera)
  end
end
