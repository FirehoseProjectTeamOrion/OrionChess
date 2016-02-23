require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe '#valid_move?' do
    before do
      # Note: We want the board to be emptry for this test.
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    it 'return true if pieces is opponent' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'black', game: queen.game)
      expect(queen.opponent_piece?(2, 5)).to eq(true)
    end

    it 'return true if pieces is present' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 1, column: 3, color: 'black', game: queen.game)
      expect(queen.piece_present?(1, 3)).to eq(true)
    end

    it 'return false if pieces is not present' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      expect(queen.piece_present?(3, 3)).to eq(false)
    end

    it 'return false if not not_obstructed?(path obstructed)' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 0, column: 5, game: game)
      expect(queen.not_obstructed?(0, 6)).to eq(false)
    end

    it 'return true if not_obstructed? (path clear) ' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, row: 0, column: 3, game: game)
      expect(queen.not_obstructed?(3, 0)).to eq(true)
    end

    it 'return obstructed? true' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, game: queen.game)
      expect(queen.obstructed?(4, 7)).to eq(true)
    end

    it 'return true for valid move' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'black', game: queen.game)
      expect(queen.valid_move?(2, 5)).to eq(true)
    end

    it 'return false for not valid move' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'black', game: queen.game)
      expect(queen.valid_move?(2, 6)).to eq(false)
    end

    it 'return false because destination has our pieces' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, color: 'white', game: queen.game)
      expect(queen.valid_move?(2, 5)).to eq(false)
    end
  end
end
