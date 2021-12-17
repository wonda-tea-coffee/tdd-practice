class Money
  attr_reader :currency

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

  class << self
    def dollar(amount)
      Dollar.new(amount, 'USD')
    end

    def franc(amount)
      Franc.new(amount, 'CHF')
    end
  end

  protected

  attr_reader :amount
end
