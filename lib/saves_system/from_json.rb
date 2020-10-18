require 'json'

class FromJSON
  def initialize(file_name)
    path_to_file = "././saves/#{file_name}"
    @file = File.read(path_to_file)
  end

  def load_file
    @valera_stats = JSON.parse @file
    self
  end

  def init_stats(valera)
    valera.stats = @valera_stats
    self
  end
end
