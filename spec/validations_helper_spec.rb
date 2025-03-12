require 'spec_helper'
require './lib/validations_helper'

RSpec.describe 'Hacker Rank Bot Saves Princess' do
  describe '#validateInteger' do
    context 'when n is even' do
      it 'raises IntegerValidationError' do
        expect { validateInteger(4)}
          .to raise_error(IntegerValidationError, /n must be an odd integer/)
      end
    end
  end

  describe '#validateGrid' do
    context 'when grid is empty' do
      it 'raises GridError' do
        expect {validateGrid(3, [])}
          .to raise_error(GridError, /grid is empty/)
      end
    end

    context 'when grid dimensions dont match n' do
      it 'raises GridError' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - -]
        ]

        expect { validateGrid(5, grid) }
          .to raise_error(GridError, /grid must have the same row and column count as given integer/)
      end
    end

    context 'when input is valid' do
      it 'returns nil' do
        grid = [
          %w[- - -],
          %w[- - -],
          %w[- - -]
        ]
        expect(validateGrid(3, grid)).to be_nil
      end
    end
  end
end