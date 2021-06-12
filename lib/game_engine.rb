class GameEngine
  attr_reader :state, :count_neighbours

  def initialize(initial_state, count_alive_neighbours)
    @state = initial_state
    @count_neighbours = count_alive_neighbours
  end

  def next_generation
    all_cells_with_alive_neighbours_count = count_all_cells_neighbours

    update_all_cells_states(all_cells_with_alive_neighbours_count)
  end

  private

  def count_all_cells_neighbours
    all_cells_with_alive_neighbour_counts = []
    (0...state.length).each do |row|
      (0...state.length).each do |col|
        cell_position = { row: row, col: col }
        number_of_alive_neighbour_cells = count_alive_neighbours.of_a_cell_at(state, cell_position)
        all_cells_with_alive_neighbour_counts << [cell_position, number_of_alive_neighbour_cells]
      end
    end
    all_cells_with_alive_neighbour_counts
  end

  def update_all_cells_states(all_cells_with_alive_neighbours_counts)
    all_cells_with_alive_neighbours_counts.each do |cell_position, number_of_alive_neighbour_cells|
      state[cell_position[:row]][cell_position[:col]].next_generation_state(number_of_alive_neighbour_cells)
    end
  end
end
