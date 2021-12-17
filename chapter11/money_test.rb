require 'minitest/autorun'
require 'minitest/unit'
require_relative './money'

MiniTest.autorun

class MoneyTest < MiniTest::Test
  def test_multiplication
    five = Money.dollar(5)
    assert_equal Money.dollar(10), five.times(2)
    assert_equal Money.dollar(15), five.times(3)
  end

  def test_equality
    assert_equal Money.dollar(5), Money.dollar(5)
    assert Money.dollar(5) != Money.dollar(7)
    assert Money.dollar(5) != Money.franc(5)
    assert_equal Money.new(45, 'USD'), Money.dollar(45)
  end

  def test_frunc_multiplication
    five = Money.franc(5)
    assert_equal Money.franc(10), five.times(2)
    assert_equal Money.franc(15), five.times(3)
  end

  def test_currency
    assert_equal 'USD', Money.dollar(1).currency
    assert_equal 'CHF', Money.franc(1).currency
  end
end
