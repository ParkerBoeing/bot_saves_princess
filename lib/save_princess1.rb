def displayPathtoPrincess(n, grid)
  center = n / 2

  if grid[0][0] == 'p'
    puts ("UP\nLEFT\n" * center)
  elsif grid[0][-1] == 'p'
    puts ("UP\nRIGHT\n" * center)
  elsif grid[-1][0] == 'p'
    puts ("DOWN\nLEFT\n" * center)
  else
    puts ("DOWN\nRIGHT\n" * center)
  end
end


# m = gets.to_i

# grid = Array.new(m)

# (0...m).each do |i|
#     grid[i] = gets.strip
# end

# displayPathtoPrincess(m,grid)