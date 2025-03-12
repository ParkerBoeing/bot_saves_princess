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
end
