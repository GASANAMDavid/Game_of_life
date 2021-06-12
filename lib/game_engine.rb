require_relative '../lib/find_neighbours'

class GameEngine
  attr_reader :state, :count_neighbours

  def initialize(initial_state, count_neighbours)
    @state = initial_state
    @count_neighbours = count_neighbours
  end

  def next_generation
    all_cell_neighbours = []

    (0...state.length).each do |row|
      (0...state.length).each do |col|
        cell_position = { row: row, col: col }
        cell_neighbours = count_neighbours.of(state, cell_position)
        all_cell_neighbours << [cell_position, cell_neighbours]
      end
    end

    all_cell_neighbours.each do |cell_position, cell_neighbors|
      state[cell_position[:row]][cell_position[:col]].next_generation_cell_state(cell_neighbors)
    end
  end
end
