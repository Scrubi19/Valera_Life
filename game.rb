require_relative 'lib/saves_system/to_json'
require_relative 'lib/valera'
require_relative 'lib/saves_system/from_json'

class Game
  def initialize
    @valera = Valera.new
  end

  def start
    ToJSON.new(@valera).init_stats.create_save
    FromJSON.new('save.json').load_file.init_stats(@valera)
  end

  def stop
    ToJSON.new(@valera).init_stats.create_save
  end
end

game = Game.new
game.start
game.stop
