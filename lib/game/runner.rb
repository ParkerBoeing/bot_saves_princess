BOARD_SIZE = 5

def generate_board(bot_pos, princess_pos, reveal_princess = false)
  board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE, "-") }
  board[bot_pos[0]][bot_pos[1]] = "m"
  board[princess_pos[0]][princess_pos[1]] = "p" if reveal_princess
  board
end

def display_board(board)
  system("clear") || system("cls")
  board.each do |row|
    puts row.join(" ")
  end
end
