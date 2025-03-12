require 'spec_helper'
require './lib/save_princess2'

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
      it 'returns nil' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - -]
        ]
        expect(findPrincess(grid)).to be_nil
      end
    end
  end
end
