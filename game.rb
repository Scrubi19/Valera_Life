require_relative 'lib/valera'
require_relative 'lib/save_management/save_json'
require_relative 'lib/save_management/load_json'
require_relative 'lib/game_process/menu'

class Game
  def initialize
    @valera = Valera.new
  end

  def create_session
    system('reset')

    until @valera.stats!['state?']['dead']
      Menu.print_stats(@valera.stats!)
      Menu.print_menu(@valera.stats!)

      choice = Menu.select_in_range(10)

      @valera = Modification.next_iteration(@valera, choice)
      system('reset')
    end

    puts 'You can never become a valera!'
  end
end

game = Game.new
game.create_session
