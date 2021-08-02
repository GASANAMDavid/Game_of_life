class Cell
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def alive?
    @state == :alive
  end

  def next_generation_state(neighbours)
    stategy = {
      alive: AliveStrategy.new,
      dead: DeadStrategy.new
    }[@state]

    @state = stategy.execute(neighbours)
  end
end

class AliveStrategy
  def execute(neighbors)
    return :dead if neighbors < 2 || neighbors > 3

    :alive
  end
end

class DeadStrategy
  def execute(neighbors)
    return :alive if neighbors == 3

    :dead
  end
end