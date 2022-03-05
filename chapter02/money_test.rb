require 'minitest/autorun'
require 'minitest/unit'
require_relative './dollar'

MiniTest::Unit.autorun

class MoneyTest < MiniTest::Unit::TestCase
  def test_multiplication
    five = Dollar.new(5)
    product = five.times(2)
    assert_equal 10, product.amount

    product = five.times(3)
    assert_equal 15, product.amount
  end
end
