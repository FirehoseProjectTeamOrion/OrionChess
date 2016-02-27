require 'rails_helper'

RSpec.describe Bishop, type: :model do
  before do
    # Note: We want the board to be emptry for this test.
    allow_any_instance_of(Game).to receive(:populate_board!).and_return true
  end

  describe '#valid_move?' do
    before :each do
      @game = FactoryGirl.create(:game)
      @white_bishop = FactoryGirl.create(:white_bishop, game: @game)
      @black_bishop = FactoryGirl.create(:black_bishop, game: @white_bishop.game)
    end
    it 'returns true when bishop moves diagonal three spaces.' do
      expect(@white_bishop.valid_move?(3, 5)).to eq(true)
    end

    it 'returns true when trying to move to an opponents piece' do
      expect(@white_bishop.valid_move?(4, 6)).to eq(true)
    end

    it 'return false when move is invalid' do
      expect(@white_bishop.valid_move?(1, 5)).to eq(false)
    end

    it 'returns false when piece is obstructed?' do
      FactoryGirl.create(:piece, row: 1, column: 3, color: 'white', game: @white_bishop.game)
      expect(@white_bishop.valid_move?(1, 3)).to eq(false)
    end
  end
end
