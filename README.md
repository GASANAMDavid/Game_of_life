# Welcome to the Game of Life Kata in Ruby

This is a game of life kata

### Rules of the Game

1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overpopulation.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.





[[alive_cell, dead_cell, alive_cell],
[alive_cell, dead_cell, alive_cell],
[alive_cell, alive_cell, alive_cell]]

Neighbouring cells possible positions

directions = { west: { row: 0, col: 1 }, east: { row: 0, col: -1 }, north: { row: -1, col: 0 },
south: { row: 1, col: 0 }, south_east: { row: 1, col: -1 }, south_west: { row: 1, col: 1 }, north_east: { row: -1, col: -1 }, north_west: { row: -1, col: 1 } }

expect(game.state[0][0]).not_to be_alive
expect(game.state[0][1]).to be_alive
expect(game.state[0][2]).not_to be_alive
expect(game.state[1][0]).to be_alive
expect(game.state[1][1]).not_to be_alive
expect(game.state[1][2]).to be_alive
expect(game.state[2][0]).to be_alive
expect(game.state[2][1]).not_to be_alive
expect(game.state[2][2]).to be_alive

[[alive_cell, dead_cell]]
