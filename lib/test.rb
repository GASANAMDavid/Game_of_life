def count_neighbours_of_a_cell(array)
  all_neighbours = []
  p array[-1][-1]
  (0...array.length).each do |row|
    (0...array.length).each do |col|
      value = find_neighnbours(array, row, col)
      puts value
      all_neighbours << [[row, col], value]
    end
  end
  all_neighbours
end

def find_neighnbours(array, row, col)
  count = 0

  # (row - 1...row + 1).each do |i|
  #   (col - 1...col + 1).each do |j|
  #     count += 1 if array[i][j] == true
  #   end
  # end
  possible_neighbours_positions = [[-1, -1], [-1, 0], [-1, 1], [0, -1],
                                   [0, 1], [1, 0], [1, 1], [1, -1]]

  neighbours = []
  possible_neighbours_positions.each do |neighbour|
    neighbour[0] += row
    neighbour[1] += col
    neighbours << neighbour
  end

  filter_valid_neighbours = neighbours.select { |neigh| neigh.none? { |a| a.negative? || a >= array.length } }
  filter_valid_neighbours.each do |neighbour|
    var = array[neighbour[0]][neighbour[1]]
    count += 1 if var == true
  end
  count
end

cell_index_and_neighbors = count_neighbours_of_a_cell([[true, false, true], [true, false, true], [true, false, true]])

puts cell_index_and_neighbors.to_s
