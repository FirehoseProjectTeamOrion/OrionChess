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
      @white_king = FactoryGirl.create(:king, row: 0, column: 5, color: 'white', moved: false, game: @game)
      @white_rook1 = FactoryGirl.create(:white_rook,  row: 0, column: 0, moved: false, game: @game)
      @white_rook2 = FactoryGirl.create(:white_rook,  row: 0, column: 7, moved: false, game: @game)
      @white_knight = FactoryGirl.create(:knight,  row: 0, column: 1, color: 'white', game: @game)
    end
    
    it 'can castle' do
      expect(@white_king.can_castle?(0, 7)).to eq(true)
    end
    
    it 'cannot castle' do
      expect(@white_king.can_castle?(0, 0)).to eq(false)
    end
  end
  
  describe '#castle!' do
    before :each do
      @game = FactoryGirl.create(:game)
      @white_king = FactoryGirl.create(:king, color: 'white', moved: false, game: @game)
      @white_rook1 = FactoryGirl.create(:white_rook, moved: false, game: @game)
      @white_rook2 = FactoryGirl.create(:white_rook, moved: false, row: 0, column: 7, game: @game)
      @white_knight = FactoryGirl.create(:knight, color: 'white', game: @game)
      @black_king = FactoryGirl.create(:king, color: 'black', moved: false, row: 7, column: 4, game: @game)
      @black_rook1 = FactoryGirl.create(:black_rook, moved: true, row: 7, column: 0, game: @game)
      @black_rook2 = FactoryGirl.create(:black_rook, moved: false, row: 7, column: 7, game: @game)
    end
    
    it 'it should return true if successfully castling' do
      expect(@white_king.castle!(0, 7)).to eq(true)
    end
    
    it 'should return false cuz of obstruction' do
      expect(@white_king.castle!(0, 0)).to eq(false)
    end
    
    it 'should return true cuz never moved' do
      expect(@black_king.castle!(7, 7)).to eq(true)
    end
    
    it 'should return false cuz rook moved before' do
      expect(@black_king.castle!(7, 0)).to eq(false)
    end
  end
end
