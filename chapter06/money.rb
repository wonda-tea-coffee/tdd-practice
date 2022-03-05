class Money
  def ==(money)
    amount == money.amount
  end

  protected

  attr_reader :amount
end
