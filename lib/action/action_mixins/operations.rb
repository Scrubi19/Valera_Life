module Operations
  def money(res)
    res <= 0 ? 0 : res
  end

  def fun(res)
    if res >= 10
      10
    elsif res <= -10
      @stats['state?']['dead'] = true
      res
    else
      res
    end
  end

  def fatigue(res)
    if res >= 100
      @stats['state?']['dead'] = true
      100
    elsif res <= 0
      0
    else
      res
    end
  end

  def health(res)
    if res >= 100
      100
    elsif res <= 0
      @stats['state?']['dead'] = true
      res
    else
      res
    end
  end

  def mana(res)
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
