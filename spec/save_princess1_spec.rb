require 'spec_helper'
require './lib/save_princess1'

RSpec.describe 'Hacker Rank Bot Saves Princess' do
  describe '#findPrincessCorner' do
    it 'returns :top_left if p is at grid[0][0]' do
      grid = [
        %w[p -],
        %w[- -]
      ]
      expect(findPrincessCorner(grid)).to eq(:top_left) 
    end

    it 'returns :top_right if p is at grid[0][-1]' do
      grid = [
        %w[- p],
        %w[- -]
      ]
      expect(findPrincessCorner(grid)).to eq(:top_right) 
    end

    it 'returns :bottom_left if p is at grid[-1][0]' do
      grid = [
        %w[- -],
        %w[p -]
      ]
      expect(findPrincessCorner(grid)).to eq(:bottom_left) 
    end

    it 'returns :bottom_right if p is at grid[-1][-1]' do
      grid = [
        %w[- -],
        %w[- p]
      ]
      expect(findPrincessCorner(grid)).to eq(:bottom_right) 
    end

    it 'returns nil if p isnt in any corner' do
      grid = [
        %w[- -],
        %w[- -]
      ]
      expect(findPrincessCorner(grid)).to be_nil 
    end
  end

  describe '#displayPathToPrincess' do
    context 'when the princess is in a corner' do
      it 'prints UP LEFT for top_left' do
        grid = [
          %w[p - - - -],
          %w[- - - - -],
          %w[- - m - -],
          %w[- - - - -],
          %w[- - - - -]
        ]
        expected_output = "UP\nLEFT\n" * 2
        expect { displayPathtoPrincess(5, grid) }.to output(expected_output).to_stdout
      end

      it 'prints UP RIGHT for top_right' do
        grid = [
          %w[- - - - p],
          %w[- - - - -],
          %w[- - m - -],
          %w[- - - - -],
          %w[- - - - -]
        ]
        expected_output = "UP\nRIGHT\n" * 2
        expect { displayPathtoPrincess(5, grid) }.to output(expected_output).to_stdout
      end

      it 'prints DOWN LEFT for bottom_left' do
        grid = [
          %w[- - - - -],
          %w[- - - - -],
          %w[- - m - -],
          %w[- - - - -],
          %w[p - - - -]
        ]
        expected_output = "DOWN\nLEFT\n" * 2
        expect { displayPathtoPrincess(5, grid) }.to output(expected_output).to_stdout
      end

      it 'prints DOWN RIGHT for bottom_right' do
        grid = [
          %w[- - - - -],
          %w[- - - - -],
          %w[- - m - -],
          %w[- - - - -],
          %w[- - - - p]
        ]
        expected_output = "DOWN\nRIGHT\n" * 2
        expect { displayPathtoPrincess(5, grid) }.to output(expected_output).to_stdout
      end
    end

    context 'when the princess is not in any corner' do
      it 'raises an PrincessError' do
        grid = [
          %w[- - - - -],
          %w[- - - - -],
          %w[- p m - -],
          %w[- - - - -],
          %w[- - - - -]
        ]
        expect { displayPathtoPrincess(5, grid) }
          .to raise_error(PrincessError, /Princess must be a 'p' in a corner/)
      end
    end
  end
end