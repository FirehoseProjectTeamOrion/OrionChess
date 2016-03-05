require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe '#valid_move?' do
    before do
      # Note: We want the board to be emptry for this test.
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    let!(:game) { FactoryGirl.create(:game) }
    let!(:queen) { FactoryGirl.create(:queen, game: game) }

    it 'return true if capturing an opponent' do
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'black', game: queen.game)
      expect(queen.valid_move?(2, 5)).to eq(true)
    end

    it 'return true if not_obstructed? (path clear) ' do
      expect(queen.valid_move?(3, 0)).to eq(true)
    end

    it 'return false if path is obstructed' do
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'black', game: queen.game)
      expect(queen.valid_move?(3, 6)).to eq(false)
    end

    it 'return false because destination has our pieces' do
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'white', game: queen.game)
      expect(queen.valid_move?(2, 5)).to eq(false)
    end

    it 'returns false if move is not a legal path' do
      expect(queen.valid_move?(2, 4)).to eq(false)
    end

    it 'returns false if trying to capture an opponent while path is obstructed' do
      FactoryGirl.create(:white_pawn, row: 1, column: 4, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'black', game: game)
      expect(queen.valid_move?(2, 5)).to eq(false)
    end
  end
end
