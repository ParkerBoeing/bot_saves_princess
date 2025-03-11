def nextMove(n, r, c, grid)
  princessRow = nil
  princessCol = nil

  grid.each_with_index do |row, i|
    j = row.index('p')
    if j
      princessRow = i
      princessCol = j
      break
    end
  end

  if princessRow > r
    puts "DOWN"
  elsif princessRow < r
    puts "UP"
  elsif princessCol > c
    puts "RIGHT"
  else
    puts "LEFT"
  end
end