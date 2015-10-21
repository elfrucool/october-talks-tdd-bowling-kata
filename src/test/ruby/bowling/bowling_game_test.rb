require 'minitest/autorun'
require_relative '../../../main/ruby/bowling/game'

class BowlingGameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_gutter_game
    roll_many(20, 0)
    assert_equal(0, @game.score)
  end

  def test_all_ones
    roll_many(20, 1)
    assert_equal(20, @game.score)
  end

  def test_one_spare
    roll_spare
    @game.roll(3)
    roll_many(17, 0)
    assert_equal(10 + 3 + 3, @game.score)
  end

  def test_one_strike
    roll_strike
    @game.roll(3)
    @game.roll(4)
    roll_many(16, 0)
    assert_equal(10 + 3 + 4 + 3 + 4, @game.score)
  end

  def test_perfect_game
    roll_many(10 + 1 + 1, 10)
    assert_equal(300, @game.score)
  end

  private
  def roll_many(rolls, pins)
    rolls.times { @game.roll(pins) }
  end

  def roll_spare
    2.times { @game.roll(5) }
  end

  def roll_strike
    @game.roll(10)
  end
end
