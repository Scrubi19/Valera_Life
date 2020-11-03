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
    '1' => ->(valera) { Work.new(valera) },
    '2' => ->(valera) { Chill.new(valera) },
    '3' => ->(valera) { WineSerial.new(valera) },
    '4' => ->(valera) { GoBar.new(valera) },
    '5' => ->(valera) { SingingSubway.new(valera) },
    '6' => ->(valera) { MarginalDrink.new(valera) },
    '7' => ->(valera) { Sleep.new(valera) }
  }

  def next_iteration(valera, choice)
    ModificationMixin.act[choice].call(valera)
  end

  class << self
    attr_reader :act
  end
end
