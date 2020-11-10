require 'json'

class LoadJSON
  def initialize(file_name)
    @file = File.read("././saves/#{file_name}.json")
  end

  def load_file(valera)
    @valera_stats = JSON.parse @file
    valera.stats = @valera_stats
  end

  def self.enter_filename
    Dir['saves/**/*.json'].each_with_index do |item, index|
      puts "#{index + 1}) #{item.sub!('.json', '').sub!('saves/', '')}"
    end
    gets.chomp.to_s
  end
end
