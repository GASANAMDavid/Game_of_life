class GameEngine
  attr_reader :game_state

  def initialize(initial_game_state)
    @game_state = initial_game_state
  end

  def state
    @initial_game_state.board
  end
end
