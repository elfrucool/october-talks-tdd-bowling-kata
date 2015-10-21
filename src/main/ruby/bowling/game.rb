class Game
  def initialize
    @current_roll = 0
    @rolls = []
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = frame_index = 0
    10.times do
      if strike?(frame_index)
        score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        score += 10 + spare_bonus(@rolls[frame_index + 2])
        frame_index += 2
      else
        score += 10 + pins_thrown_in_strike(frame_index)
        frame_index += 2
      end
    end
    score
  end

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end

  def spare?(frame_index)
    @rolls[frame_index].to_i + @rolls[frame_index + 1].to_i == 10
  end

  def spare_bonus(roll)
    roll
  end

  def strike_bonus(frame_index)
    @rolls[frame_index + 1].to_i + @rolls[frame_index + 2].to_i
  end

  def pins_thrown_in_strike(frame_index)
    @rolls[frame_index].to_i + @rolls[frame_index + 1].to_i
  end
end
