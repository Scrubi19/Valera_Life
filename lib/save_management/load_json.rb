require 'json'

class LoadJSON
  def initialize(file_name)
    path_to_file = "././saves/#{file_name}.json"
    @file = File.read(path_to_file)
  end

  def load_file(valera)
    @valera_stats = JSON.parse @file
    valera.stats = @valera_stats
  end
end
