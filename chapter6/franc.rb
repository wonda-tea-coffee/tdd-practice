require_relative './money'

class Franc < Money
  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end
end
