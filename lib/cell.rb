class Cell
  attr_accessor :cell_state

  def initialize(initial_cell_state)
    @cell_state = initial_cell_state
  end

  def next_generation_cell_state(neighbours)
    case cell_state
    when 'Alive'
      @cell_state = 'Dead' unless [2, 3].include?(neighbours)
    when 'Dead'
      @cell_state = 'Alive' if neighbours == 3
    end
  end
end
