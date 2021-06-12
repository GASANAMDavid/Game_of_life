# frozen_string_literal: true

# Cell class depicts a real cell in space
class Cell
  attr_reader :state

  def initialize(initial_cell_state)
    @state = initial_cell_state
  end

  def alive?
    return true if state == 'Alive'

    false
  end

  def next_generation_state(neighbours)
    case state
    when 'Alive'
      @state = 'Dead' unless [2, 3].include?(neighbours)
    when 'Dead'
      @state = 'Alive' if neighbours == 3
    end
  end
end
