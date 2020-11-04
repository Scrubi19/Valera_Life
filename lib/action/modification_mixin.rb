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

module ModificationMixin
  attr_accessor :act

  @act = {
    '1' => lambda { |valera, choice|
      valera.stats!['state?'][choice] ? Work.new(valera) : valera
    },
    '2' => lambda { |valera, choice|
      valera.stats!['state?'][choice] ? Chill.new(valera) : valera
    },
    '3' => lambda { |valera, choice|
      valera.stats!['state?'][choice] ? WineSerial.new(valera) : valera
    },
    '4' => lambda { |valera, choice|
      valera.stats!['state?'][choice] ? GoBar.new(valera) : valera
    },
    '5' => lambda { |valera, choice|
      valera.stats!['state?'][choice] ? SingingSubway.new(valera) : valera
    },
    '6' => lambda { |valera, choice|
      valera.stats!['state?'][choice] ? MarginalDrink.new(valera) : valera
    },
    '7' => lambda { |valera, choice|
      valera.stats!['state?'][choice] ? Sleep.new(valera) : valera
    }
  }

  def next_iteration(valera, choice)
    ModificationMixin.act[choice].call(valera, choice)
  end

  class << self
    attr_reader :act
  end
end
