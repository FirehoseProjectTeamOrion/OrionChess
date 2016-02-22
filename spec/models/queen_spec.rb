require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe '#valid_move?' do

    it 'return true if pieces is opponent' do
      # this test is validated!2
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game )
      FactoryGirl.create(:piece, row: 2, column: 5,color: "black", game: queen.game)
      expect(queen.opponent_piece?(2,5)).to eq(true)
    end

    it 'return true if pieces is present' do
      # this test needs working
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game )
      FactoryGirl.create(:piece, row: 2, column: 5,color: "black", game: queen.game)
      expect(queen.piece_present?(0, 2)).to eq(false)
    end

    it 'return not_obstructed? false' do
      queen = FactoryGirl.create(:queen, row: 0, column: 3)
      FactoryGirl.create(:piece, row: 1, column: 4, game: queen.game)
      expect(queen.not_obstructed?(0, 6)).to eq(false)
    end

    it 'return not_obstructed? true' do
      queen = FactoryGirl.create(:queen, row: 0, column: 3)
      FactoryGirl.create(:piece, row: 2, column: 4, game: queen.game)
      expect(queen.not_obstructed?(4, 3)).to eq(true)
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
      FactoryGirl.create(:piece, row: 2, column: 5, game: queen.game)
      expect(queen.valid_move?(2, 2)).to eq(true)
    end

    it 'return false for not valid move' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, game: queen.game)
      expect(queen.valid_move?(2, 6)).to eq(false)
    end

    it 'return false because destination has our pieces' do
      game = FactoryGirl.create(:game)
      queen = FactoryGirl.create(:queen, game: game)
      FactoryGirl.create(:piece, row: 2, column: 5, game: queen.game)
      expect(queen.valid_move?(2, 6)).to eq(false)
    end
  end
end
