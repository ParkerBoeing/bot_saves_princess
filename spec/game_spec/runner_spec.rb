require 'rspec'
require_relative '../../lib/game/runner'

BOARD_SIZE = 5

RSpec.describe 'Bot Saves Princess methods' do
  describe '#generateBoard' do
    let(:bot_pos) { [2, 2] }
    let(:princess_pos) { [3, 4] }

    context 'when reveal_princess is false' do
      it 'returns a board with BOARD_SIZE rows and columns' do
        board = generateBoard(bot_pos, princess_pos, false)
        expect(board.size).to eq(BOARD_SIZE)
        board.each { |row| expect(row.size).to eq(BOARD_SIZE) }
      end

      it "places the bot's marker ('m') on the board" do
        board = generateBoard(bot_pos, princess_pos, false)
        expect(board[bot_pos[0]][bot_pos[1]]).to eq('m')
      end

      it "does not place the princess's marker on the board" do
        board = generateBoard(bot_pos, princess_pos, false)
        expect(board[princess_pos[0]][princess_pos[1]]).to eq('-')
      end
    end

    context 'when reveal_princess is true' do
      it "places the princess's marker ('p') on the board" do
        board = generateBoard(bot_pos, princess_pos, true)
        expect(board[princess_pos[0]][princess_pos[1]]).to eq('p')
      end
    end
  end

  describe '#displayBoard' do
    let(:board) do
      [
        ['-', '-', '-', '-', '-'],
        ['-', '-', '-', '-', '-'],
        ['-', '-', 'm', '-', '-'],
        ['-', '-', '-', '-', '-'],
        ['-', '-', '-', 'p', '-']
      ]
    end

    it 'clears the console and prints the board' do
      expect_any_instance_of(Object).to receive(:system).with("clear").and_return(true)
      expected_output = board.map { |row| row.join(' ') + "\n" }.join
      expect { displayBoard(board) }.to output(expected_output).to_stdout
    end
  end

  describe '#displayInstructions' do
    it 'prints the instructions and sleeps for 10 seconds' do
      expect_any_instance_of(Object).to receive(:sleep).with(10)
      expect { displayInstructions }.to output(/Welcome to Bot Saves Princess!/).to_stdout
    end
  end

  describe '#getBotAndPrincessPositions' do
    it 'returns an array with two positions' do
      positions = getBotAndPrincessPositions
      expect(positions).to be_an(Array)
      expect(positions.size).to eq(2)
    end

    it 'returns the bot position at the center of the board' do
      positions = getBotAndPrincessPositions
      bot_pos = positions.first
      expected_center = [BOARD_SIZE / 2, BOARD_SIZE / 2]
      expect(bot_pos).to eq(expected_center)
    end

    it 'returns a princess position that is different from the bot position' do
      positions = getBotAndPrincessPositions
      bot_pos, princess_pos = positions
      expect(princess_pos).not_to eq(bot_pos)
    end

    it 'returns a princess position within the board boundaries' do
      positions = getBotAndPrincessPositions
      _, princess_pos = positions
      expect(princess_pos[0]).to be_between(0, BOARD_SIZE - 1)
      expect(princess_pos[1]).to be_between(0, BOARD_SIZE - 1)
    end
  end

  describe '#calculateOptimalMoves' do
    it 'calculates the number of optimized moves when princess is below and to the right' do
      bot_pos = [0, 0]
      princess_pos = [2, 3]
      expected_moves = 2 + 3
      expect(calculateOptimalMoves(bot_pos, princess_pos)).to eq(expected_moves)
    end

    it 'calculates the number of optimized moves when princess is above and to the left' do
      bot_pos = [3, 3]
      princess_pos = [1, 0]
      expected_moves = (3 - 1).abs + (3 - 0).abs
      expect(calculateOptimalMoves(bot_pos, princess_pos)).to eq(expected_moves)
    end

    it 'calculates the number of optimized moves for positions on the same row or column' do
      bot_pos = [2, 1]
      princess_pos = [2, 4]
      expected_moves = (2 - 2).abs + (4 - 1).abs
      expect(calculateOptimalMoves(bot_pos, princess_pos)).to eq(3)
    end
  end
end
