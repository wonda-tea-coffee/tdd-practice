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

  def plus(addend); end

  attr_reader :augend, :addend
end
