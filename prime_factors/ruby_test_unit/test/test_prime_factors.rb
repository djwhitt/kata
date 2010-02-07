require 'test/unit'
require 'test_helper'

require 'prime_factors'

class TestPrimeFactors < Test::Unit::TestCase
  def setup
    @p = PrimeFactors
  end

  def test_one
    assert_equal [], @p.generate(1)
  end

  def test_two
    assert_equal [2], @p.generate(2)
  end

  def test_three
    assert_equal [3], @p.generate(3)
  end

  def test_four
    assert_equal [2, 2], @p.generate(4)
  end

  def test_six
    assert_equal [2, 3], @p.generate(6)
  end

  def test_eight
    assert_equal [2, 2, 2], @p.generate(8)
  end

  def test_nine
    assert_equal [3, 3], @p.generate(9)
  end
end
