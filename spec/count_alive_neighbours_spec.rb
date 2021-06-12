require_relative '../lib/cell'
require_relative '../lib/count_alive_neighbours'

RSpec.describe CountAliveNeighbours do
  let(:alive_cell) { Cell.new('Alive') }
  let(:dead_cell) { Cell.new('Dead') }
  let(:game_state) { [[alive_cell, alive_cell], [dead_cell, dead_cell]] }
  let(:count_alive_neighbours) { CountAliveNeighbours.new }
  context '#of' do
    it 'counts alive neighbour cell in west direction' do
      expect(count_alive_neighbours.of_a_cell_at(game_state, { row: 0, col: 0 })).to eq 1
    end

    it 'counts alive neighbour cell located at east' do
      expect(count_alive_neighbours.of_a_cell_at(game_state, { row: 0, col: 0 })).to eq 1
    end
  end
end
