require_relative '../lib/count_living_neighbours'
require_relative '../lib/cell'
describe CountLivingNeighbours do
  let(:living_cell) { AliveCell.new(:alive) }
  let(:dead_cell) { DeadCell.new(:dead) }
  let(:game_state) do
    [[living_cell, dead_cell, living_cell],
     [living_cell, dead_cell, dead_cell],
     [living_cell, living_cell, living_cell]]
  end

  it 'return living neighbours of a cell' do
    count_living_neighbours = CountLivingNeighbours.new
    expect(count_living_neighbours.of_a_cell_at(game_state, { row: 0, col: 0 })).to eq(1)
    expect(count_living_neighbours.of_a_cell_at(game_state, { row: 0, col: 1 })).to eq(3)
    expect(count_living_neighbours.of_a_cell_at(game_state, { row: 0, col: 2 })).to eq(0)
    expect(count_living_neighbours.of_a_cell_at(game_state, { row: 1, col: 0 })).to eq(3)
  end
end
