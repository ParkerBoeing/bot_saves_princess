def nextMove(n, r, c, grid)
  validateInput(n, grid)
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
  else
    raise PrincessError, "Princess must be represented as the character p somewhere on the grid."
  end
end

def validateInput(n, grid)
  raise GridError, "grid is empty" if grid.empty?
  stripped_grid = grid.map { |row| row.strip }

  if stripped_grid.size != n || stripped_grid.first.size != n
    raise GridError, "grid must have the same row and column count as given integer n"
  end
end

def findPrincess(grid)
  grid.each_with_index do |row, i|
    col = row.index('p')
    return [i, col] if col
  end
end

GridError     = Class.new(ArgumentError)
PrincessError = Class.new(ArgumentError)