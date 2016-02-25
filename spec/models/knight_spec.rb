require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe '#valid_move?' do

    before do
      # Note: We want the board to be emptry for this test.
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    it 'return true for valid move' do
      game = FactoryGirl.create(:game)
      knight = FactoryGirl.create(:knight, game: game)
      FactoryGirl.create(:black_pawn, row: 2, column: 0, game: game)


      expect(knight.valid_move?(2, 2)).to eq(true)
      expect(knight.valid_move?(2, 0)).to eq(true)
      expect(knight.valid_move?(4, 0)).to eq(true)

    end

    it 'return false for not valid move' do
      game = FactoryGirl.create(:game)
      knight = FactoryGirl.create(:knight, game: game)
      FactoryGirl.create(:white_pawn, row: 2, column: 0, game: game)

      expect(knight.valid_move?(2, 6)).to eq(false)
      expect(knight.valid_move?(2, 0)).to eq(false)
      expect(knight.valid_move?(2, 3)).to eq(false)
      expect(knight.valid_move?(2, 6)).to eq(false)

    end
  end
end
