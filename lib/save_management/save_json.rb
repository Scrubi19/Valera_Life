require 'json'

class SaveJSON
  def initialize(obj)
    @valera_stats = obj.stats!
  end

  def create_save(path)
    File.open("././saves/#{path}.json", 'w') do |f|
      f.write(@valera_stats.to_json)
    end
  end

  def self.enter_filename
    gets.chomp.to_s
  end
end
