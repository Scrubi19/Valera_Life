require 'yaml'

class Valera
  attr_accessor :stats

  def initialize(level = 'easy', path_to_config = 'lib/start_config.yml')
    @stats = YAML.safe_load(File.read(path_to_config))[level]
    @stats['state?'] = {
      '1' => true,
      '2' => true,
      '3' => true,
      '4' => true,
      '5' => true,
      '6' => true,
      '7' => true
    }
  end

  def dead?
    (@stats['fun'] <= -10) || (@stats['health']).negative?
  end

  def stats!
    @stats
  end
end
