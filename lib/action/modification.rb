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
    },
    '8' => lambda { |valera, _choice|
      save = SaveJSON.new(valera)
      puts 'Enter username:'
      save.create_save(gets.chomp.to_s)
      valera
    },
    '9' => lambda { |valera, _choice|
      files = Dir['saves/**/*.json']
      files.each_with_index do |item, index|
        item = item.sub!('saves/', '')
        puts "#{index + 1}) #{item.sub!('.json', '')}"
      end
      puts 'Enter filename'
      load = LoadJSON.new(gets.chomp.to_s)
      load.load_file(valera)
      valera
    }
  }

  def self.next_iteration(valera, choice)
    @act[choice].call(valera, choice)
  end
end
