require_relative '../lib/cell'
require_relative '../lib/game_engine'

RSpec.describe GameEngine do
  let(:dead_cell) { Cell.new('Dead') }
  let(:alive_cell) { Cell.new('Alive') }
  let(:initial_state) { [[alive_cell]] }
  let(:count_neighbours) { double('FindNeighbours') }
  let(:game) { GameEngine.new(initial_state, count_neighbours) }

  it 'creates the game with initial state' do
    expect(game.state).to eq initial_state
  end

  context '#next_generation' do
    xit 'finds next generation of an isolated cell' do
      cell_position = { row: 0, col: 0 }
      allow(count_neighbours).to receive(:of).with(game.state, cell_position).and_return(0)
      game.next_generation
      expect(game.state[0][0].alive?).to eq false
    end
  end
  context 'neighbouring cells' do
    let(:initial_state) { [[alive_cell, dead_cell], [alive_cell, dead_cell]] }
    # before do
    #   puts game.state.to_s
    #   [
    #     { row: 0, col: 0 },
    #     { row: 0, col: 1 }
    #   ].each do |cell_position|
    #     allow(count_neighbours).to receive(:of).with(game.state, cell_position).and_return(1).twice
    #   end
    # end

    it 'finds next generation of an two neighbouring cells' do
      allow(count_neighbours).to receive(:of).and_return(1)

      game.next_generation
      expect(game.state[0][0].alive?).to eq false
      expect(game.state[1][0].alive?).to eq false
    end
  end
end
