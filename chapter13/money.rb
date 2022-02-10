require_relative './sum'

class Money
  attr_reader :currency, :amount

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(money)
    amount == money.amount && self.currency == money.currency
  end

  def times(multiplier)
    self.class.new(amount * multiplier, currency)
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def reduce(to)
    self
  end

  class << self
    def dollar(amount)
      new(amount, 'USD')
    end

    def franc(amount)
      new(amount, 'CHF')
    end
  end
end
