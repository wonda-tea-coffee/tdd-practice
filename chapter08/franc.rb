require_relative './money'

class Franc < Money
  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def currency
    
  end
end
