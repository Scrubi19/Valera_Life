require_relative 'lib/valera'
require_relative 'lib/saves_system/to_json'
require_relative 'lib/saves_system/from_json'
require_relative 'lib/game_process/menu'

class Game
  include ModificationMixin

  def initialize
    @valera = Valera.new
  end

  def game
    system('reset') # wor with terminal only
    Menu.print_stats(@valera.stats!)

    until @valera.stats!['state?']['dead']
      Menu.print_menu(@valera.stats!)

      choice = Menu.input_choice
      break if choice.to_i == 10

      @valera = next_iteration(@valera, choice)

      system('reset')
      Menu.print_stats(@valera.stats!)
    end

    puts 'You can never become a valera!'
  end
end

game = Game.new
game.game
