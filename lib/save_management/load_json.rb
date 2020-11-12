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
    files = []
    Dir['saves/**/*.json'].each_with_index do |item, index|
      files[index] = item
      puts "#{index + 1}) #{item.sub!('.json', '').sub!('saves/', '')}"
    end
    filename = gets.chomp.to_s
    unless files.include?(filename)
      puts 'error-1: file does not exist'
      exit
    end
    filename
  end
end
