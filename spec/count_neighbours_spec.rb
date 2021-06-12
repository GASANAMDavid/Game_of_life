require_relative '../lib/cell'
require_relative '../lib/count_neighbours'

RSpec.describe CountNeighbours do
  let(:alive_cell) { Cell.new('Alive') }
  let(:dead_cell) { Cell.new('Dead') }
  let(:game_state) { [[alive_cell, alive_cell], [alive_cell, dead_cell]] }
  let(:count_neighbours) { CountNeighbours.new }
  context '#of' do
    it 'returns zero' do
      expect(count_neighbours.of(game_state, { row: 0, col: 1 })).to eq 2
    end
  end
end
