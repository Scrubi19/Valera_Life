require 'json'

class ToJSON
  def initialize(obj)
    @valera = obj
  end

  def init_stats
    @valera_stats = @valera.stats
    self
  end

  def create_save
    File.open('././saves/save.json', 'w') do |f|
      f.write(@valera_stats.to_json)
    end
    self
  end
end
