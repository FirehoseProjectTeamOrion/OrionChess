require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe "is_obstructed?" do
    it "should return false for no horizontal obstructions" do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)

      expect(piece.is_obstructed?(0, 5)).to eq(false)
    end

    it "should return true for horizontal obstructions" do
      piece1 = FactoryGirl.create(:piece, row: 0, column: 3)
      piece2 = FactoryGirl.create(:piece, row: 0, column: 4)

      expect(piece1.is_obstructed?(0, 5)).to eq(true)
    end

    it "should return false for no vertical obstructions" do
      piece = FactoryGirl.create(:piece, row: 3, column: 5)
      expect(piece.is_obstructed?(0, 5)).to eq(false)
    end

    it "should return true for vertical obstructions" do
      piece1 = FactoryGirl.create(:piece, row: 3, column: 5)
      piece2 = FactoryGirl.create(:piece, row: 1, column: 5)

      expect(piece1.is_obstructed?(0, 5)).to eq(true)
    end

    it "should return false for no diagonal obstructions" do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      expect(piece.is_obstructed?(4, 4)).to eq(false)
    end

    it "should return true for diagonal obstructions" do
      piece1 = FactoryGirl.create(:piece, row: 2, column: 2)
      piece2 = FactoryGirl.create(:piece, row: 3, column: 3)

      expect(piece1.is_obstructed?(4, 4)).to eq(true)
    end

    it "should return false when there is a piece at the destination and none in between" do
      piece1 = FactoryGirl.create(:piece, row: 0, column: 3)
      piece2 = FactoryGirl.create(:piece, row: 0, column: 5)

      expect(piece1.is_obstructed?(0, 5)).to eq(false)
    end

    it "should raise an error message if input is invalid" do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)

      expect(piece.is_obstructed?(2, 4)).to raise_error("Input is invalid")
    end
  end
end
