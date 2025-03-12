require 'spec_helper'
require_relative '../../lib/hacker_rank_challenges/save_princess2'

RSpec.describe 'Hacker Rank Bot Saves Princess 2' do
  describe '#findPrincess' do
    context 'when princess is present' do
      it 'returns correct coordinates when princess is at the top left' do
        grid = [
          %w[p - -],
          %w[- - -],
          %w[- - -]
        ]
        expect(findPrincess(grid)).to eq([0, 0])
      end

      it 'returns correct coordinates when princess is in the middle' do
        grid = [
          %w[- - -],
          %w[- p -],
          %w[- - -]
        ]
        expect(findPrincess(grid)).to eq([1, 1])
      end

      it 'returns correct coordinates when princess is at the bottom right' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - p]
        ]
        expect(findPrincess(grid)).to eq([2, 2])
      end
    end

    context 'when princess is not present' do
      it 'raises an error' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - -]
        ]
        expect { nextMove(3, 1, 1, grid) }
          .to raise_error(PrincessError, /Princess must be represented as the character p somewhere on the grid./)
      end
    end
  end

  describe '#nextMove' do
    context 'when princess is above the current position' do
      it 'prints UP' do
        grid = [
          %w[- p -],
          %w[- m -],
          %w[- - -]
        ]
        expect { nextMove(3, 1, 1, grid) }
          .to output("UP\n").to_stdout
      end
    end

    context 'when princess is below the current position' do
      it 'prints DOWN' do
        grid = [
          %w[- - -],
          %w[- m -],
          %w[- p -]
        ]
        expect { nextMove(3, 1, 1, grid) }
          .to output("DOWN\n").to_stdout
      end
    end

    context 'when princess is to the right of the current position' do
      it 'prints RIGHT' do
        grid = [
          %w[- - -],
          %w[- m p],
          %w[- - -]
        ]
        expect { nextMove(3, 1, 1, grid) }
          .to output("RIGHT\n").to_stdout
      end
    end

    context 'when princess is to the left of the current position' do
      it 'prints LEFT' do
        grid = [
          %w[- - -],
          %w[p m -],
          %w[- - -]
        ]
        expect { nextMove(3, 1, 1, grid) }
          .to output("LEFT\n").to_stdout
      end
    end

    context 'when princess is at the current position' do
      it "prints \"You've found the princess!\"" do
        grid = [
          %w[- - -],
          %w[- p -],
          %w[- - -]
        ]
        expect { nextMove(3, 1, 1, grid) }
          .to output("You've found the princess!\n").to_stdout
      end
    end

    context 'when princess is not present in the grid' do
      it 'raises an error' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - -]
        ]
        expect { nextMove(3, 1, 1, grid) }
          .to raise_error(PrincessError, /Princess must be represented as the character p somewhere on the grid./)
      end
    end
  end
end
