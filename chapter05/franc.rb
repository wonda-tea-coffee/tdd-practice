class Franc
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def ==(franc)
    amount == franc.amount
  end
end
