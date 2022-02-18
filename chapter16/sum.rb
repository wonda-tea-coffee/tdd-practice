class Sum
  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank, to)
    amount = augend.reduce(bank, to).amount \
              + addend.reduce(bank, to).amount
    Money.new(amount, to)
  end

  def plus(addend)
    self.class.new(self, addend)
  end

  def times(multiplier)
    self.class.new(augend.times(multiplier), addend.times(multiplier))
  end

  attr_reader :augend, :addend
end
