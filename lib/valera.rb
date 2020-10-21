class Valera
  attr_accessor :stats

  def initialize(health = 100, mana = 0, fun = 0, money = 0, fatigue = 0)
    @stats = {
      'health' => health,
      'mana' => mana,
      'fun' => fun,
      'fatigue' => fatigue,
      'money' => money
    }
  end

  def dead?
    @stats['fun'] <= -10 and (@stats['health']).negative?
  end

  def stats!
    @stats
  end
end
