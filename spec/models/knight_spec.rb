require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe '#valid_move?' do
    before do
      # Note: We want the board to be emptry for this test.
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    it 'return true for valid move' do
      game = FactoryGirl.create(:game)
      knight = FactoryGirl.create(:knight, row: 3, column: 4, game: game)

      expect(knight.valid_move?(5, 5)).to eq(true)
      expect(knight.valid_move?(1, 3)).to eq(true)
      expect(knight.valid_move?(4, 2)).to eq(true)
    end

    it 'return false for not valid move' do
      game = FactoryGirl.create(:game)
      knight = FactoryGirl.create(:knight, row: 3, column: 4, game: game)

      expect(knight.valid_move?(2, 7)).to eq(false)
      expect(knight.valid_move?(2, 0)).to eq(false)
      expect(knight.valid_move?(2, 3)).to eq(false)
      expect(knight.valid_move?(2, 1)).to eq(false)
    end
  end
end
