require_relative 'conditions'

module ChangeStatsMixin
  include Conditions

  class << self
    attr_reader :new_stat, :op
  end

  @new_stat = {
    'money' => ->(stat_obj, res) { money stat_obj, res },
    'mana' => ->(stat_obj, res) { mana stat_obj, res },
    'fun' => ->(stat_obj, res) { fun stat_obj, res },
    'fatigue' => ->(stat_obj, res) { fatigue stat_obj, res },
    'health' => ->(stat_obj, res) { health stat_obj, res }
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

    ChangeStatsMixin.new_stat[stat].call @stats, res
  end

  def self.money(stat_obj, res)
    res <= 0 ? 0 : res
  end

  def self.fun(stat_obj, res)
    if res >= 10
      10
    elsif res <= -10
      stat_obj['state?']['dead'] = true
      res
    else
      res
    end
  end

  def self.fatigue(stat_obj, res)
    if res >= 100
      stat_obj['state?']['dead'] = true
      100
    elsif res <= 0
      0
    else
      res
    end
  end

  def self.health(stat_obj, res)
    if res >= 100
      100
    elsif res <= 0
      stat_obj['state?']['dead'] = true
      res
    else
      res
    end
  end

  def self.mana(stat_obj, res)
    if res >= 100
      stat_obj['state?']['dead'] = true
      res
    elsif res <= 0
      0
    else
      res
    end
  end
end
