require_relative '../lib/cell'
require_relative '../lib/game_engine'

RSpec.describe GameEngine do
  let(:dead_cell) { Cell.new('Dead') }
  let(:alive_cell) { Cell.new('Alive') }
  let(:initial_state) { [alive_cell] }
  let(:game) { GameEngine.new(initial_state) }
  it 'creates the game with initial state' do
    expect(game.state).to eq initial_state
  end

  context '#next_generation' do
    it 'finds next generation of an isolated cell' do
      expect(game).to receive(:find_alive_neigbouring_cells).and_return(1)
      game.next_generation
      expect(game.state[0].cell_state).to eq('Dead')
    end

    # it 'finds next generation of an isolated cell' do
    #   expect(game).to receive(:find_neighnbours_alive_neigbouring_cells).and_return(1)
    #   game.next_generation
    #   expect(game.state[0].cell_state).to eq('Dead')
    # end
  end

  context 'find_alive_neigbouring_cells' do
    let(:initial_state) { [[alive_cell], [alive_cell]] }
    it 'finds alive cell at the north of the current cell' do
      expect(game.find_alive_neigbouring_cells({ row: 1, col: 0 })).to eq 1
    end

    it 'finds alive cell at north-east of the current cell' do
      initial_state = [[1, 0], [1, 0]]
      expect(game.find_alive_neigbouring_cells({ row: 1, col: 1 })).to eq 2
    end
  end
end
