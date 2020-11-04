require_relative 'conditions'
require_relative 'operations'

module ChangeStatsMixin
  private
  include Conditions
  include Operations

  def take_op(stat, operation, number)
    res = {
      '+' => @stats[stat] + number,
      '-' => @stats[stat] - number
    }[operation]

    res += 50 if singing_normal_drunk?
    res += number if sleeping_not_drunk?
    res -= number if sleeping_drunk?

    return money res if stat == 'money'
    return mana res if stat == 'mana'
    return fun res if stat == 'fun'
    return fatigue res if stat == 'fatigue'
    health res if stat == 'health'
  end
end
