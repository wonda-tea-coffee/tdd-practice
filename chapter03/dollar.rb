class Dollar
  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def ==(dollar)
    amount == dollar.amount
  end

  private

  attr_reader :amount
end
