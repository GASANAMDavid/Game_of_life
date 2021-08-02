require_relative '../lib/game_of_life'
require_relative '../lib/cell'

describe GameOfLife do
  let(:dead_cell) { DeadCell.new(:dead) }
  let(:living_cell) { AliveCell.new(:alive) }
  let(:initial_state) do
    [[living_cell, dead_cell, living_cell],
     [living_cell, dead_cell, dead_cell],
     [living_cell, living_cell, living_cell]]
  end

  let(:count_living_neighbours) { double('CountLivingNeighbours') }

  let(:game) { GameOfLife.new(initial_state, count_living_neighbours) }

  it 'initializes the game with initial state' do
    expect(game.state).to eq(initial_state)
  end

  it 'determines the evolution of the game' do
    allow(count_living_neighbours).to receive(:of_a_cell_at).and_return(1, 3, 0, 3, 6, 3, 2, 3, 1)
    game.evolve
    expect(game.state[0][0]).not_to be_alive
    expect(game.state[0][1]).to be_alive
    expect(game.state[0][2]).not_to be_alive
    expect(game.state[1][0]).to be_alive
    expect(game.state[1][1]).not_to be_alive
    expect(game.state[1][2]).to be_alive
    expect(game.state[2][0]).to be_alive
    expect(game.state[2][1]).to be_alive
    expect(game.state[2][2]).not_to be_alive
  end
end
