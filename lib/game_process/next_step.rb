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

class NextStep
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

    check(choose.to_str, valera)
  end

  def check(choose, valera)
    # Work.new valera if choose == '1'
    # Chill.new valera if choose == '2'
    # WineSerial.new valera if choose == '3'
    # GoBar.new valera if choose == '4'
    # MarginalDrink.new valera if choose == '5'
    # SingingSubway.new valera if choose == '6'
    # Sleep.new valera if choose == '7'
    case choose
    when '1'
      Work.new valera
    when '2'
      Chill.new valera
    when '3'
      WineSerial.new valera
    when '4'
      GoBar.new valera
    when '5'
      MarginalDrink.new valera
    when '6'
      SingingSubway.new valera
    when '7'
      Sleep.new valera
    else
      p 'Error!'
    end
  end
end
