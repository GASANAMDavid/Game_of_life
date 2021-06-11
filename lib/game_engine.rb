class GameEngine
  attr_reader :state

  def initialize(initial_state)
    @state = initial_state
  end

  def next_generation
    neighbours = find_alive_neigbouring_cells({ row: 0, col: 1 })
    state[0].next_generation_cell_state(neighbours)
  end

  def find_alive_neigbouring_cells(_position)
    1
  end
end
