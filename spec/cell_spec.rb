require_relative '../lib/cell'
RSpec.describe Cell do
  let(:dead_cell) { Cell.new('Dead') }
  let(:alive_cell) { Cell.new('Alive') }

  describe '#next_generation_cell_state' do
    context 'Any live cell with fewer than two live neighbours' do
      it 'dies, as if by underpopulation' do
        neighbours = 1
        alive_cell.next_generation_cell_state(neighbours)
        expect(alive_cell.cell_state).to eq('Dead')
      end
    end

    context 'Any live cell with two or three live neighbours' do
      it 'lives on to the next generation' do
        neighbours = 2
        alive_cell.next_generation_cell_state(neighbours)
        expect(alive_cell.cell_state).to eq('Alive')
      end
    end

    context 'Any live cell with more than three live neighbours' do
      it 'dies, as if by overpopulation' do
        neighbours = 4
        alive_cell.next_generation_cell_state(neighbours)
        expect(alive_cell.cell_state).to eq('Dead')
      end
    end

    context 'Any dead cell with exactly three live neighbours' do
      it 'becomes a live cell, as if by reproduction' do
        neighbours = 3
        dead_cell.next_generation_cell_state(neighbours)
        expect(dead_cell.cell_state).to eq('Alive')
      end

      it 'remains dead if neighbours are less or greater than 3' do
        [2, 4].each do |neighbours|
          dead_cell.next_generation_cell_state(neighbours)
          expect(dead_cell.cell_state).to eq('Dead')
        end
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
