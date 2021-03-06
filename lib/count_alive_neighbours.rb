class CountAliveNeighbours
  attr_reader :directions

  def initialize
    @directions = { west: { row: 0, col: 1 }}
  end

  def of_a_cell_at(game_state, cell_position)
    count = 0
    directions.each do |_, direction|
      new_row = cell_position[:row] + direction[:row]
      new_col = cell_position[:col] + direction[:col]
      count += 1 if valid_cell(game_state.size, { row: new_row, col: new_col }) && game_state[new_row][new_col].alive?
    end
    count
  end

  def valid_cell(board_size, cell_position)
    !cell_position.values.include?(board_size) && !cell_position.values.include?(-1)
  end
end
