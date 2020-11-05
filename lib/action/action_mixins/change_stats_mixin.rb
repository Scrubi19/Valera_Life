require_relative 'conditions'

module ChangeStatsMixin
  include Conditions

  class << self
    attr_reader :stats, :op
  end

  @stats = {
    'money' => ->(res) { money res },
    'mana' => ->(res) { mana res },
    'fun' => ->(res) { fun res },
    'fatigue' => ->(res) { fatigue res },
    'health' => ->(res) { health res }
  }

  @op = {
    '+' => ->(stat, number) { stat + number },
    '-' => ->(stat, number) { stat - number }
  }

  def take_op(stat, operation, number)
    res = ChangeStatsMixin.op[operation].call @stats[stat], number

    res += 50 if singing_normal_drunk?
    res += number if sleeping_not_drunk?
    res -= number if sleeping_drunk?

    ChangeStatsMixin.stats[stat].call res
  end

  def self.money(res)
    res <= 0 ? 0 : res
  end

  def self.fun(res)
    if res >= 10
      10
    elsif res <= -10
      @stats['state?']['dead'] = true
      res
    else
      res
    end
  end

  def self.fatigue(res)
    if res >= 100
      @stats['state?']['dead'] = true
      100
    elsif res <= 0
      0
    else
      res
    end
  end

  def self.health(res)
    if res >= 100
      100
    elsif res <= 0
      @stats['state?']['dead'] = true
      res
    else
      res
    end
  end

  def self.mana(res)
    if res >= 100
      @stats['state?']['dead'] = true
      res
    elsif res <= 0
      0
    else
      res
    end
  end
end
