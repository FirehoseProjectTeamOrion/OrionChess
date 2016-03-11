require 'rails_helper'

RSpec.describe Rook, type: :model do
  before do
    # Note: We want the board to be emptry for this test.
    allow_any_instance_of(Game).to receive(:populate_board!).and_return true
  end

  describe '#valid_move?' do
    before :each do
      @game = FactoryGirl.create(:game)
      @white_rook = FactoryGirl.create(:white_rook, game: @game)
      @black_rook = FactoryGirl.create(:black_rook, game: @game)
    end
    it 'returns true when rook moves horizontal three spaces.' do
      expect(@white_rook.valid_move?(3, 0)).to eq(true)
    end

    it 'returns true when rook moves vertical three spaces.' do
      expect(@white_rook.valid_move?(0, 3)).to eq(true)
    end

    it 'returns true when trying to move to an opponents piece' do
      expect(@white_rook.valid_move?(0, 7)).to eq(true)
    end

    it 'return false when move is invalid' do
      expect(@white_rook.valid_move?(1, 5)).to eq(false)
    end

    it 'returns false when piece is obstructed?' do
      FactoryGirl.create(:piece, row: 0, column: 3, color: 'white', game: @game)
      expect(@white_rook.valid_move?(0, 5)).to eq(false)
    end

    it 'returns false when trying to capture a piece while path is obstructed' do
      FactoryGirl.create(:piece, row: 0, column: 3, color: 'white', game: @game)
      expect(@white_rook.valid_move?(0, 7)).to eq(false)
    end
  end

  describe '#kingside?' do
    before :each do
      @game = FactoryGirl.create(:game)
      @white_rook1 = FactoryGirl.create(:white_rook, game: @game)
      @white_rook2 = FactoryGirl.create(:white_rook, row: 0, column: 7, game: @game)
    end

    it 'return true if rook is king side' do
      expect(@white_rook2.kingside?).to eq(true)
    end

    it 'return false if rook is not king side' do
      expect(@white_rook1.kingside?).to eq(false)
    end
  end

  describe '#queenside?' do
    before :each do
      @game = FactoryGirl.create(:game)
      @white_rook1 = FactoryGirl.create(:white_rook, game: @game)
      @white_rook2 = FactoryGirl.create(:white_rook, row: 0, column: 7, game: @game)
    end

    it 'return true if rook is queenside' do
      expect(@white_rook1.queenside?).to eq(true)
    end

    it 'return false if rook is not queenside' do
      expect(@white_rook2.queenside?).to eq(false)
    end
  end
end
