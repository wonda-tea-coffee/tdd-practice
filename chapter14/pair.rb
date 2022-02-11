class Pair
  def initialize(from, to)
    @from = from
    @to = to
  end

  def eql?(object)
    from == object.from && to == object.to
  end

  def hash
    0
  end

  attr_reader :from, :to
end
