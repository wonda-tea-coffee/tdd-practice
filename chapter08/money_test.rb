require 'minitest/autorun'
require 'minitest/unit'
require_relative './dollar'
require_relative './franc'

MiniTest::Unit.autorun

class MoneyTest < MiniTest::Unit::TestCase
  def test_multiplication
    five = Money.dollar(5)
    assert_equal Money.dollar(10), five.times(2)
    assert_equal Money.dollar(15), five.times(3)
  end

  def test_equality
    assert_equal Money.dollar(5), Money.dollar(5)
    assert Money.dollar(5) != Money.dollar(7)
    assert_equal Money.franc(5), Money.franc(5)
    assert Money.franc(5) != Money.franc(7)
    assert Money.dollar(5) != Money.franc(5)
  end

  def test_frunc_multiplication
    five = Money.franc(5)
    assert_equal Money.franc(10), five.times(2)
    assert_equal Money.franc(15), five.times(3)
  end
end
