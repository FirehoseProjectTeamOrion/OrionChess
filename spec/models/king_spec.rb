require 'rails_helper'

RSpec.describe Piece, type: :model do

  describe '#valid_move?' do
    it "return true for valid move" do
      king = FactoryGirl.create(:piece, type: 'King', row: 0, column: 4)
      expect(king.valid_move?(1,3)).to eq(true)
    end

    it "return false for not valid move" do
      king = FactoryGirl.create(:piece, type: 'King', row: 0, column: 4)
      expect(king.valid_move?(2,6)).to eq(false)
    end
  end

end
