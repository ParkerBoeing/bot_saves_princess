require 'spec_helper'
require './lib/save_princess1'

RSpec.describe 'Hacker Rank Bot Saves Princess' do
  describe '#validateInput' do
    context 'when n is even' do
      it 'raises ArgumentError' do
        expect { validateInput(4, [])}
          .to raise_error(ArgumentError, /n must be an odd integer/)
      end
    end

    context 'when grid is empty' do
      it 'raises ArgumentError' do
        expect {validateInput(3, [])}
          .to raise_error(ArgumentError, /grid is empty/)
      end
    end

    context 'when grid dimensions dont match n' do
      it 'raises ArgumentError' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - -]
        ]

        expect { validateInput(5, grid) }
          .to raise_error(ArgumentError, /grid must have the same row and column count as given integer/)
      end
    end

    context 'when input is valid' do
      it 'returns true' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - -]
        ]
        expect(validateInput(3, grid)).to eq(true)
      end
    end
  end
end