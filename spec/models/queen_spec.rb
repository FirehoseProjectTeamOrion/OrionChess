require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe '#valid_move?' do
    it 'return true for valid move' do
      queen = FactoryGirl.create(:queen)
      expect(queen.valid_move?(1, 3)).to eq(true)
    end

    it 'return false for not valid move' do
      queen = FactoryGirl.create(:queen)
      expect(queen.valid_move?(2, 6)).to eq(false)
    end
  end
end
