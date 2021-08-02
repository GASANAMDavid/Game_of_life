class Cell
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def alive?
    @state == :alive
  end
end

class AliveCell < Cell
  def next_generation_state(neighbours)
    @state = :Dead unless [2, 3].include?(neighbours)
  end
end

class DeadCell < Cell
  def next_generation_state(neighbours)
    @state = :alive if neighbours == 3
  end
end
