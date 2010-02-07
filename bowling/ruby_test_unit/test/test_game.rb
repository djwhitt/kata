require 'test/unit'
require 'test_helper'

require 'game'

class TestGame < Test::Unit::TestCase
  def setup
    @g = Game.new
  end

  def roll_many(n, pins)
    n.times do
      @g.roll pins
    end
  end

  def roll_spare
    @g.roll 5
    @g.roll 5
  end
  
  def test_gutter_game
    roll_many 20, 0
    assert_equal 0, @g.score
  end

  def test_all_ones
    roll_many 20, 1
    assert_equal 20, @g.score
  end

  def test_one_spare
    roll_spare
    @g.roll 3
    roll_many 17, 0
    assert_equal 16, @g.score
  end

  def test_one_strike
    @g.roll 10
    @g.roll 3
    @g.roll 4
    roll_many 16, 0
    assert 24, @g.score
  end

  def test_perfect_game
    roll_many 12, 10
    assert_equal 300, @g.score
  end
end
