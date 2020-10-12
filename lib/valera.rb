class Valera
  attr_accessor :health, :mana, :fun, :fatigue, :money

  def initialize(health: 100, mana: 0, fun: 0, money: 0, fatigue: 0)
    self.health = health
    self.mana = mana
    self.fun = fun
    self.fatigue = fatigue
    self.money = money
  end

  def dead?
    health <= 0 || fun <= -10
  end
end
