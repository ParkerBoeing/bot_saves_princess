BOARD_SIZE = 5

def generateBoard(bot_pos, princess_pos, reveal_princess = false)
  board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE, "-") }
  board[bot_pos[0]][bot_pos[1]] = "m"
  board[princess_pos[0]][princess_pos[1]] = "p" if reveal_princess
  board
end

def displayBoard(board)
  system("clear") || system("cls")
  board.each do |row|
    puts row.join(" ")
  end
end

def displayInstructions
  puts "Welcome to Bot Saves Princess!\n
        Where you, the noble bot, must rescue the princess in as few moves as you can.\n
        But the room is shrouded in fog!! Where can she be...?\n
        Your score will be calculated based on how many moves it takes you to find the princess\n
        compared to the shortest path. The game will begin in 10 seconds.\n
        Good luck and fare well brave little bot!"
  sleep(10)
end