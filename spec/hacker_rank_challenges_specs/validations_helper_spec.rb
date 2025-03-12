require 'spec_helper'
require_relative '../../lib/hacker_rank_challenges/validations_helper'

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
    context 'when grid rows are strings with extra whitespace and spaces' do
      it 'processes the grid correctly by stripping and splitting rows' do
        grid = [
          "  p - -  ",
          "  - - -  ",
          "  - - -  "
        ]
        expect { validateGrid(3, grid) }.not_to raise_error
      end
    end

    context 'when grid rows are strings with extra whitespace but no spaces' do
      it 'processes the grid correctly by stripping without splitting' do
        grid = [
          "  p--  ",
          "  ---  ",
          "  ---  "
        ]
        expect { validateGrid(3, grid) }.not_to raise_error
      end
    end

    context 'when splitting results in a row of incorrect length' do
      it 'raises GridError' do
        grid = [
          "  p - - -  ",
          "  - - -  ",
          "  - - -  "
        ]
        expect { validateGrid(3, grid) }
          .to raise_error(GridError, /grid must have the same row and column count as given integer n/)
      end
    end

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