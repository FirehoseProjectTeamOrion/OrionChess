require 'rails_helper'

RSpec.describe King, type: :model do
  describe '#valid_move?' do
    it 'return true for valid move' do
      king = FactoryGirl.create(:king)
      expect(king.valid_move?(1, 3)).to eq(true)
    end

    it 'return false for not valid move' do
      king = FactoryGirl.create(:king)
      expect(king.valid_move?(2, 6)).to eq(false)
    end
  end
end
