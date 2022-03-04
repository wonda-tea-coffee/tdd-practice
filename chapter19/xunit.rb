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

  def run
    set_up
    method(name).call
  end
end

class WasRun < TestCase
  attr_accessor :was_run
  attr_accessor :was_set_up

  def set_up
    self.was_run = false
    self.was_set_up = true
  end

  def test_method
    self.was_run = true
  end
end

class TestCaseTest < TestCase
  def set_up
    @test = WasRun.new('test_method')
  end

  def test_running
    @test.run
    assert @test.was_run
  end

  def test_set_up
    @test.run
    assert @test.was_set_up
  end
end

TestCaseTest.new('test_running').run
TestCaseTest.new('test_set_up').run
