class AssertionError < StandardError; end

def assert(val)
  if val == true
    puts "OK!"
  else
    raise AssertionError.new(val)
  end
end

class TestCase
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def set_up; end

  def tear_down; end

  def run
    set_up
    method(name).call
    tear_down
  end
end

class WasRun < TestCase
  attr_accessor :log

  def set_up
    self.log = "set_up "
  end

  def test_method
    self.log += 'test_method '
  end

  def tear_down
    self.log += 'tear_down '
  end
end

class TestCaseTest < TestCase
  def test_template_method
    test = WasRun.new('test_method')
    test.run
    assert 'set_up test_method tear_down ' == test.log
  end
end

TestCaseTest.new('test_template_method').run
