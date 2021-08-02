class GameOfLife
  attr_reader :state, :count_living_neighbours

  def initialize(state, count_living_neighbours)
    @state = state
    @count_living_neighbours = count_living_neighbours
  end

  def evolve
    @state = update_state
  end

  private

  def update_state
    new_state = Array.new(state.size) { Array.new(state.size) }

    count = 0
    (0...state.size).each do |row|
      (0...state.size).each do |col|
        cell_position = { row: row, col: col }
        count = count_living_neighbours.of_a_cell_at(state, cell_position)
        new_state[row][col] = state[row][col].clone
        new_state[row][col].next_generation_state(count)
      end
    end
    new_state
  end
end
