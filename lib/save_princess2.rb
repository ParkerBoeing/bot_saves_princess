require 'validations_helper'

def nextMove(n, r, c, grid)
  validateGrid(n, grid)
  princessRow, princessCol = findPrincess(grid)

  if princessRow > r
    puts "DOWN"
  elsif princessRow < r
    puts "UP"
  elsif princessCol > c
    puts "RIGHT"
  elsif princessCol < c
    puts "LEFT"
  elsif princessRow == r && princessCol == c
    puts "You've found the princess!"
  end
end

def findPrincess(grid)
  grid.each_with_index do |row, i|
    col = row.index('p')
    return [i, col] if col
  end
  raise PrincessError, "Princess must be represented as the character p somewhere on the grid."
end
