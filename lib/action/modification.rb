require_relative '../save_management/save_json'
require_relative '../valera'
require_relative '../action/sleep'
require_relative '../action/chill'
require_relative '../action/wine_serial'
require_relative '../action/work'
require_relative '../action/singing_subway'
require_relative '../action/go_bar'
require_relative '../action/marginal_drink'
require_relative '../save_management/load_json'

class Modification
  attr_accessor :act

  @act = {
    '1' => lambda { |valera, choice, _filename|
      valera.stats!['state?'][choice] ? Work.new(valera) : valera
    },
    '2' => lambda { |valera, choice, _filename|
      valera.stats!['state?'][choice] ? Chill.new(valera) : valera
    },
    '3' => lambda { |valera, choice, _filename|
      valera.stats!['state?'][choice] ? WineSerial.new(valera) : valera
    },
    '4' => lambda { |valera, choice, _filename|
      valera.stats!['state?'][choice] ? GoBar.new(valera) : valera
    },
    '5' => lambda { |valera, choice, _filename|
      valera.stats!['state?'][choice] ? SingingSubway.new(valera) : valera
    },
    '6' => lambda { |valera, choice, _filename|
      valera.stats!['state?'][choice] ? MarginalDrink.new(valera) : valera
    },
    '7' => lambda { |valera, choice, _filename|
      valera.stats!['state?'][choice] ? Sleep.new(valera) : valera
    },
    '8' => lambda { |valera, _choice, filename|
      save = SaveJSON.new(valera)
      save.create_save(filename)
      valera
    },
    '9' => lambda { |valera, _choice, filename|
      load = LoadJSON.new(filename)
      load.load_file(valera)
      valera
    }
  }

  def self.next_iteration(valera, choice, filename = nil)
    if filename.nil?
      filename = SaveJSON.enter_filename if choice == '8'
      filename = LoadJSON.enter_filename if choice == '9'
    end

    @act[choice].call(valera, choice, filename)
  end
end
