require_relative 'lib/saves_system/to_json'
require_relative 'lib/valera'
require_relative 'lib/action/sleep'
require_relative 'lib/action/chill'
require_relative 'lib/action/wine_serial'
require_relative 'lib/action/work'
require_relative 'lib/action/singing_subway'
require_relative 'lib/action/go_bar'
require_relative 'lib/action/marginal_drink'
require_relative 'lib/saves_system/from_json'

class Game
  def initialize
    @valera = Valera.new
  end

  def start
    ToJSON.new(@valera).init_stats.create_save
    FromJSON.new('save.json').load_file.init_stats(@valera)

    valera = Work.new Valera.new
    p valera.stats!
  end

  def stop
    ToJSON.new(@valera).init_stats.create_save
  end
end

game = Game.new
game.start
game.stop
