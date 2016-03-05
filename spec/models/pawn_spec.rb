require 'rails_helper'

RSpec.describe Pawn, type: :model do
  before do
    # Note: We want the board to be emptry for this test.
    allow_any_instance_of(Game).to receive(:populate_board!).and_return true
  end

  describe '#valid_move?' do
    it 'returns true when pawn moves to an empty space two spaces forward if it is the first move and unobstructed' do
      pawn = FactoryGirl.create(:black_pawn)

      expect(pawn.valid_move?(3, 4)).to eq(true)
    end

    it 'returns false when pawn moves to an empty space two spaces forward if it is the first move and the path is obstructed' do
      pawn = FactoryGirl.create(:black_pawn)
      FactoryGirl.create(:black_pawn, row: 2, column: 4, game: pawn.game)

      expect(pawn.valid_move?(3, 4)).to eq(false)
    end

    it 'returns false if trying to move two spaces forward and it is not the first move' do
      pawn = FactoryGirl.create(:white_pawn, row: 5)
      pawn.touch

      expect(pawn.valid_move?(3, 4)).to eq(false)
    end

    it 'returns true when pawn moves to empty space one space forward' do
      pawn = FactoryGirl.create(:black_pawn, row: 3)

      expect(pawn.valid_move?(4, 4)).to eq(true)
    end

    it 'returns false if pawn is trying to capture vertically' do
      pawn = FactoryGirl.create(:white_pawn)
      FactoryGirl.create(:piece, row: 4, column: 4, color: 'black', game: pawn.game)

      expect(pawn.valid_move?(4, 4)).to eq(false)
    end

    it 'returns false if pawn tries moving to a space occupied by a piece of the same color' do
      pawn = FactoryGirl.create(:black_pawn)
      FactoryGirl.create(:piece, row: 2, column: 4, color: 'black', game: pawn.game)

      expect(pawn.valid_move?(2, 4)).to eq(false)
    end

    it 'returns true when pawn moves diagonally one space forward to capture a piece' do
      pawn = FactoryGirl.create(:white_pawn)
      FactoryGirl.create(:piece, row: 5, column: 5, color: 'black', game: pawn.game)

      expect(pawn.valid_move?(5, 5)).to eq(true)
    end

    it 'returns false when pawn tries to move diagonally when not capturing another piece' do
      pawn = FactoryGirl.create(:black_pawn)

      expect(pawn.valid_move?(2, 5)).to eq(false)
    end

    it 'always returns false when pawn tries moving horizontally' do
      pawn = FactoryGirl.create(:white_pawn)

      expect(pawn.valid_move?(6, 5)).to eq(false)
    end

    it 'always returns false when pawn tries moving backwards' do
      pawn = FactoryGirl.create(:black_pawn)

      expect(pawn.valid_move?(0, 4)).to eq(false)
    end

    it 'always returns false when trying to move forward more than two spaces' do
      pawn = FactoryGirl.create(:white_pawn)

      expect(pawn.valid_move?(2, 4)).to eq(false)
    end

    it 'always returns false when trying to move diagonally more than one space' do
      pawn = FactoryGirl.create(:black_pawn)

      expect(pawn.valid_move?(3, 6)).to eq(false)
    end
  end
end
