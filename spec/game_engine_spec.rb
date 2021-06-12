require_relative '../lib/cell'
require_relative '../lib/game_engine'

RSpec.describe GameEngine do
  let(:dead_cell) { Cell.new('Dead') }
  let(:alive_cell) { Cell.new('Alive') }
  let(:initial_state) { [[alive_cell]] }
  let(:count_alive_neighbours) { double('CountAliveNeighbours') }
  let(:game) { GameEngine.new(initial_state, count_alive_neighbours) }

  it 'creates the game with initial state' do
    expect(game.state).to eq initial_state
  end

  context '#next_generation' do
    it 'finds next generation of an isolated cell' do
      cell_position = { row: 0, col: 0 }
      allow(count_alive_neighbours).to receive(:of_a_cell_at).with(game.state, cell_position).and_return(0)
      game.next_generation
      expect(game.state[0][0].alive?).to eq false
    end
  end
  context 'neighbouring cells' do
    let(:initial_state) { [[alive_cell, dead_cell], [alive_cell, alive_cell]] }
    it 'finds next generation of an two neighbouring cells' do
      allow(count_alive_neighbours).to receive(:of_a_cell_at).and_return(2, 3, 2, 2)

      game.next_generation
      expect(game.state[0][0]).to be_alive
      expect(game.state[0][1]).to be_alive
      expect(game.state[1][0]).to be_alive
      expect(game.state[1][1]).to be_alive
    end
  end
end
