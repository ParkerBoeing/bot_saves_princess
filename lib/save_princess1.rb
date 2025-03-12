require 'validations_helper'

def displayPathtoPrincess(n, grid)
  validateInteger(n)
  validateGrid(n, grid)

  center = n / 2
  corner = findPrincessCorner(grid)

  case corner
  when :top_left
    puts ("UP\nLEFT\n" * center)
  when :top_right
    puts ("UP\nRIGHT\n" * center)
  when :bottom_left
    puts ("DOWN\nLEFT\n" * center)
  when :bottom_right
    puts ("DOWN\nRIGHT\n" * center)
  else
    raise PrincessError, "Princess must be a 'p' in a corner of the grid."
  end
end

def findPrincessCorner(grid)
  return :top_left     if grid[0][0]   == 'p'
  return :top_right    if grid[0][-1]  == 'p'
  return :bottom_left  if grid[-1][0]  == 'p'
  return :bottom_right if grid[-1][-1] == 'p'
  nil
end