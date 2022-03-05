class Money
  def ==(money)
    amount == money.amount && self.class == money.class
  end

  protected

  attr_reader :amount
end
