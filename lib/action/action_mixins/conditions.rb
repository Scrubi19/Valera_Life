module Conditions
  def singing_normal_drunk?
    self == SingingSubway && (@stats['mana'] > 40 || @stats['mana'] < 70)
  end

  def sleeping_not_drunk?
    self == Sleep && @stats['mana'] < 70
  end

  def sleeping_drunk?
    self == Sleep && @stats['mana'] >= 30
  end
end
