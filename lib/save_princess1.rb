def displayPathtoPrincess(n, grid)
  if validateInput(n, grid) == false
    return
  end

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
    raise ArgumentError, "Princess must be a 'p' in a corner of the grid."
  end
end

def findPrincessCorner(grid)
  return :top_left     if grid[0][0]     == 'p'
  return :top_right    if grid[0][-1]    == 'p'
  return :bottom_left  if grid[-1][0]    == 'p'
  return :bottom_right if grid[-1][-1]   == 'p'
  nil
end

def validateInput(n, grid)
  raise ArgumentError, "n must be an odd integer" if n.even?
  raise ArgumentError, "grid is empty" if grid.empty?
  if grid.size != n || grid.first.size != n
    raise ArgumentError, "grid must have the same row and column count as given integer"
  end
  true
end

# m = gets.to_i

# grid = Array.new(m)

# (0...m).each do |i|
#     grid[i] = gets.strip
# end

# displayPathtoPrincess(m,grid)