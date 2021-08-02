class CountLivingNeighbours
  DIRECTIONS = { east: { row: 0, col: -1 }, south_east: { row: 1, col: -1 }, west: { row: 0, col: 1 }, south: { row: 1, col: 0 },
                 north: { row: -1, col: 0 }, south_west: { row: 1, col: 1 }, north_east: { row: -1, col: -1 }, north_west: { row: -1, col: 1 } }

  def of_a_cell_at(game_state, cell_position)
    count = 0
    DIRECTIONS.each do |_, direction|
      new_row = direction[:row] + cell_position[:row]
      new_col = direction[:col] + cell_position[:col]

      count += 1 if validate_position([new_row, new_col], game_state.size) && game_state[new_row][new_col].alive?
    end

    count
  end

  def validate_position(neighbour_position, grid_size)
    !neighbour_position.include?(-1) && !neighbour_position.include?(grid_size)
  end
end
