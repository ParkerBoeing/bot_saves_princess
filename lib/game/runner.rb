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

def getBotAndPrincessPositions
  bot_pos = [BOARD_SIZE / 2, BOARD_SIZE / 2]
  princess_pos = nil
  loop do
    princess_pos = [rand(BOARD_SIZE), rand(BOARD_SIZE)]
    break unless princess_pos == bot_pos
  end
  [bot_pos, princess_pos]
end

def calculateOptimalMoves(bot_pos, princess_pos)
  (princess_pos[0] - bot_pos[0]).abs + (princess_pos[1] - bot_pos[1]).abs
end

def moveBot(bot_pos, direction)
  case direction.downcase
  when "up"
    [bot_pos[0] - 1, bot_pos[1]]
  when "down"
    [bot_pos[0] + 1, bot_pos[1]]
  when "left"
    [bot_pos[0], bot_pos[1] - 1]
  when "right"
    [bot_pos[0], bot_pos[1] + 1]
  else
    bot_pos
  end
end

def validPosition?(pos)
  pos[0].between?(0, BOARD_SIZE - 1) && pos[1].between?(0, BOARD_SIZE - 1)
end

def getMove
  print "Enter your move (up, down, left, right): "
  gets.chomp
end

# def playGame
#   calculate bot positions
#   generate board
#   calculate number of moves for shortest path to princess
#   display instructions
#   display board
#   end if user is on princess, reveal princess and display score. otherwise:
#   get user input
#   check if valid
#   perform move
#   increment up move counter
# end