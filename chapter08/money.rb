class Money
  def initialize(amount)
    @amount = amount
  end

  def ==(money)
    amount == money.amount && self.class == money.class
  end

  class << self
    def dollar(amount)
      Dollar.new(amount)
    end

    def franc(amount)
      Franc.new(amount)
    end
  end

  protected

  attr_reader :amount
end
