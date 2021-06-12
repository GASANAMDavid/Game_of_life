class Cell
  attr_accessor :state

  def initialize(initial_cell_state)
    @state = initial_cell_state
  end

  def alive?
    return true if state == 'Alive'

    false
  end

  def next_generation_cell_state(neighbours)
    case state
    when 'Alive'
      @state = 'Dead' unless [2, 3].include?(neighbours)
    when 'Dead'
      @state = 'Alive' if neighbours == 3
    end
  end
end
