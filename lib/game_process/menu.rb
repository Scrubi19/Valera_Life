require_relative '../action/modification_mixin'

class Menu
  def self.print_menu(stats)
    Work.print_info(1, stats)
    Chill.print_info(2, stats)
    WineSerial.print_info(3, stats)
    GoBar.print_info(4, stats)
    SingingSubway.print_info(5, stats)
    MarginalDrink.print_info(6, stats)
    Sleep.print_info(7, stats)
    puts '8: Save the game'
    puts '9: Load the game'
    puts '10: Exit'
  end

  def self.print_stats(stats)
    puts '---------------'
    puts "Health: #{stats['health']}"
    puts "Mana: #{stats['mana']}"
    puts "Fun: #{stats['fun']}"
    puts "Money: #{stats['money']}"
    puts "Fatigue: #{stats['fatigue']}"
    puts '---------------'
  end

  def self.input_choice
    choice = ''
    loop do
      print "\nChoose an action: "
      choice = $stdin.gets.to_i
      break if choice >= 1 && choice <= 10
    end
    choice.to_s
  end
end
