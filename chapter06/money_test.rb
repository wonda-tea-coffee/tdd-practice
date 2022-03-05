require 'minitest/autorun'
require 'minitest/unit'
require_relative './dollar'
require_relative './franc'

MiniTest::Unit.autorun

class MoneyTest < MiniTest::Unit::TestCase
  def test_multiplication
    five = Dollar.new(5)
    assert_equal Dollar.new(10), five.times(2)
    assert_equal Dollar.new(15), five.times(3)
  end

  def test_equality
    assert_equal Dollar.new(5), Dollar.new(5)
    assert Dollar.new(5) != Dollar.new(7)
    assert_equal Franc.new(5), Franc.new(5)
    assert Franc.new(5) != Franc.new(7)
  end

  def test_frunc_multiplication
    five = Franc.new(5)
    assert_equal Franc.new(10), five.times(2)
    assert_equal Franc.new(15), five.times(3)
  end
end
