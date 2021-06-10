require_relative '../lib/game_of_life_engine'
RSpec.describe 'GameEngine' do
  context '' do
    let(:d) { double('Cell', state: 'Dead') }
    let(:a) { double('Cell', state: 'Alive') }
    let(:board) { [[d, d, a, d, d, d, d, d], [d, d, a, a, d, d, d, d], [d, d, a, a, a, d, d, d]] }
    it 'initializes a game with initial game state' do
      game = GameEngine.new(board)
      expect(game.game_state).to eq(board)
    end

    it
  end
end

# 1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
# 2. Any live cell with two or three live neighbours lives on to the next generation.
# 3. Any live cell with more than three live neighbours dies, as if by overpopulation.
# 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

# inital generation

# 0 0 1 0 0 0 0 0
# 0 0 1 1 0 0 0 0
# 0 0 1 1 1 0 0 0
# 0 0 0 0 1 1 0 0

# nextGeneration

# 0 0 1 1 0 0 0 0
# 0 1 1 0 1 0 0 0
# 0 0 1 0 0 1 0 0
# 0 0 0 0 1 1 0 0
