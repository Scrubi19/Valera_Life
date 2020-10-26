module ModificationMixin
  def check_pos_effect(choose, valera)
    return Work.new valera if choose == '1'
    return Chill.new valera if choose == '2'
    return SingingSubway.new valera if choose == '6'
    return Sleep.new valera if choose == '7'

    self
  end

  def check_neg_effect(choose, valera)
    return GoBar.new valera if choose == '4'
    return MarginalDrink.new valera if choose == '5'
    return WineSerial.new valera if choose == '3'

    self
  end
end
