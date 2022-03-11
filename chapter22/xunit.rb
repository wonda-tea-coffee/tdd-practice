class AssertionError < StandardError; end

def assert(val)
  if val == true
    puts "OK!"
  else
    raise AssertionError.new(val)
  end
end

class TestResult
  def initialize
    @run_count = 0
    @error_count = 0
  end

  def test_started
    @run_count += 1
  end

  def test_failed
    @error_count += 1
  end

  def summary
    return "#{@run_count} run, #{@error_count} failed"
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
    result = TestResult.new
    result.test_started
    set_up

    begin
      method(name).call
    rescue
      result.test_failed
    end

    tear_down
    result
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

  def test_broken_method
    raise
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

  def test_result
    test = WasRun.new('test_method')
    result = test.run
    assert '1 run, 0 failed' == result.summary
  end

  def test_failed_result
    test = WasRun.new('test_broken_method')
    result = test.run
    assert '1 run, 1 failed' == result.summary
  end

  def test_failed_result_formatting
    result = TestResult.new
    result.test_started
    result.test_failed
    assert '1 run, 1 failed' == result.summary
  end
end

TestCaseTest.new('test_template_method').run
TestCaseTest.new('test_result').run
TestCaseTest.new('test_failed_result').run
TestCaseTest.new('test_failed_result_formatting').run
