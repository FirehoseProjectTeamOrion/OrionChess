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
  
  describe '#can_castle?' do
    before :each do
      @game = FactoryGirl.create(:game)
      @white_king = FactoryGirl.create(:king, color: 'white', game: @game)
      @white_rook = FactoryGirl.create(:white_rook, game: @game)
      @white_rook_kingside = FactoryGirl.create(:white_rook, row: )
      @white_knight = FactoryGirl.create(:knight, color: 'white', game: @game)
    end
    
    it 'should return true if it can castle' do
      expect(king.can_castle!( 0,0)).to eq(true)
    end
    
    if 'should return false if unable to castle' do
      expect(king.can_castle!(0,7)).to eq(false)
    end
  end
  
end
