require 'test/unit'
require './caeser'

class TestCaeser < Test::Unit::TestCase
  def test_decode
    assert_equal("we want you", Caeser.decode(3, "zh zdqw brx"))
  end

  def test_encode
    assert_equal("zh zdqw brx", Caeser.encode(3, "we want you"))
  end
end

class TestCaeserChar < Test::Unit::TestCase
  def test_next
    assert_equal('b', Caeser::Char.new('a').next(1))
  end

  def test_prev
    assert_equal('a', Caeser::Char.new('b').prev(1))
  end

  def test_next_cycle
    assert_equal('a', Caeser::Char.new('z').next(1))
  end

  def test_prev_cycle
    assert_equal('z', Caeser::Char.new('a').prev(1))
  end

  def test_next_2
    assert_equal('c', Caeser::Char.new('a').next(2))
  end

  def test_prev_2
    assert_equal('a', Caeser::Char.new('c').prev(2))
  end

  def test_next_27
    assert_equal('b', Caeser::Char.new('a').next(27))
  end

  def test_prev_27
    assert_equal('a', Caeser::Char.new('b').prev(27))
  end
end
