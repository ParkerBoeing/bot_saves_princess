def validateGrid(n, grid)
  raise GridError, "grid is empty" if grid.empty?

  processed_grid = grid.map do |row|
    if row.is_a?(String)
      stripped = row.strip
      stripped.include?(" ") ? stripped.split : stripped
    else
      row
    end
  end

  if processed_grid.size != n || processed_grid.first.size != n
    raise GridError, "grid must have the same row and column count as given integer n"
  end
end

def validateInteger(n)
  raise IntegerValidationError, "n must be an odd integer" if n.even?
end

IntegerValidationError = Class.new(ArgumentError)
GridError        = Class.new(ArgumentError)
PrincessError    = Class.new(ArgumentError)