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

  def run
    method(name).call
  end
end

class WasRun < TestCase
  attr_accessor :was_run

  def initialize(name)
    super
    @was_run = false
  end

  def test_method
    @was_run = true
  end
end

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new('test_method')
    assert !test.was_run
    test.run
    assert test.was_run
  end
end

TestCaseTest.new('test_running').run
