require_relative './money'

class Dollar < Money
  def times(multiplier)
    self.class.new(amount * multiplier)
  end
end
