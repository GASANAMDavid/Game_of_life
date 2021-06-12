require_relative '../lib/cell'
RSpec.describe Cell do
  let(:dead_cell) { Cell.new('Dead') }
  let(:alive_cell) { Cell.new('Alive') }

  describe '#next_generation_cell_state' do
    context '#alive?' do
      it 'returns true if cell is alive' do
        expect(alive_cell).to be_alive
      end

      it 'returns false if cell is dead' do
        expect(dead_cell).not_to be_alive
      end
    end

    context 'Any live cell with fewer than two live neighbours' do
      it 'dies, as if by underpopulation' do
        neighbours = 1
        alive_cell.next_generation_state(neighbours)
        expect(alive_cell).not_to be_alive
      end
    end

    context 'Any live cell with two or three live neighbours' do
      it 'lives on to the next generation' do
        neighbours = 2
        alive_cell.next_generation_state(neighbours)
        expect(alive_cell.alive?).to eq(true)
      end
    end

    context 'Any live cell with more than three live neighbours' do
      it 'dies, as if by overpopulation' do
        neighbours = 4
        alive_cell.next_generation_state(neighbours)
        expect(alive_cell.alive?).to eq(false)
      end
    end

    context 'Any dead cell with exactly three live neighbours' do
      it 'becomes a live cell, as if by reproduction' do
        neighbours = 3
        dead_cell.next_generation_state(neighbours)
        expect(dead_cell.alive?).to eq(true)
      end
    end
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
