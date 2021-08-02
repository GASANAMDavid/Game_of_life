require_relative '../lib/cell'

describe Cell do
  let(:alive_cell) { AliveCell.new(:alive) }
  let(:dead_cell) { DeadCell.new(:dead) }
  it 'returns true if the cell is alive' do
    expect(alive_cell).to be_alive
  end

  it 'returns false if the cell is dead' do
    expect(dead_cell).not_to be_alive
  end

  context 'Any live cell with fewer than two live neighbours' do
    it 'dies, as if by underpopulation' do
      alive_cell.next_generation_state(1)
      expect(alive_cell).not_to be_alive
    end
  end

  context 'Any live with two or three live neighbours' do
    it 'lives on to next generation' do
      alive_cell.next_generation_state(2)
      expect(alive_cell).to be_alive
    end
  end

  context 'Any live with more than three live neighbours' do
    it 'dies, as if by overpopulation' do
      alive_cell.next_generation_state(4)
      expect(alive_cell).not_to be_alive
    end
  end

  context 'Any dead cell with exactly three live neighbours' do
    it 'becomes alive as if by reproduction' do
      dead_cell.next_generation_state(3)
      expect(dead_cell).to be_alive
    end
  end

  context 'Any dead cell with live neighbours dofferent to three' do
    it 'remains dead' do
      dead_cell.next_generation_state(4)
      expect(dead_cell).not_to be_alive
    end
  end
end
