require_relative 'lib/valera'
require_relative 'lib/save_management/save_json'
require_relative 'lib/save_management/load_json'
require_relative 'lib/game_process/menu'

class Game
  def initialize
    @valera = Valera.new
  end

  def create_session
    Menu.print_main_menu
    main_choice = Menu.select_in_range(3)
    if main_choice == '1'
      puts 'Enter the game level [hard, middle, easy]: '
      @valera = Valera.new gets.chomp
    end
    @valera = Modification.next_iteration(@valera, '9') if main_choice == '2'
    system('reset')

    to_valera_action main_choice

    puts 'You can never become a valera!'
  end

  def to_valera_action(main_choice)
    until @valera.stats!['state?']['dead'] && main_choice == '1'
      Menu.print_stats(@valera.stats!)
      Menu.print_menu(@valera.stats!)

      choice = Menu.select_in_range(9)

      @valera = Modification.next_iteration(@valera, choice)
      system('reset')
    end
  end
end

game = Game.new
game.create_session
