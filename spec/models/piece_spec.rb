require 'rails_helper'

RSpec.describe Piece, type: :model do
  before :each do
    # Note: We want the board to be emptry for this test.
    allow_any_instance_of(Game).to receive(:populate_board!).and_return true
  end

  describe '#move_to!' do
<<<<<<< HEAD
    before :each do
      game = FactoryGirl.create(:game)
      @piece_white = FactoryGirl.create(:piece, row: 0, column: 0, color: 'white', in_game: true, game_id: game.id)
      @piece_black = FactoryGirl.create(:piece, row: 0, column: 7, color: 'black', in_game: true, game_id: game.id)
    end
=======
   let(:piece_black) { FactoryGirl.create(:piece, row: 0, column: 7, color: 'black') }
   let(:piece_white) { FactoryGirl.create(:piece, row: 0, column: 7, color: 'white') }
>>>>>>> e286a0a79f39542065599e5dea29e6b8d0799b72
    it 'successfully moved the pieces to destination' do
      
      expect(@piece_white.move_to!(0,7)).to eq(true)
      

      
    end

    it 'should show captured pieces to be out of game' do
      
      @piece_white.move_to!(0, 7)
      expect(@piece_black.in_game).to eq(false)
    end
    
    it 'should return false because piece is our own' do
      
      white_piece = FactoryGirl.create(:piece, row: 4, column: 4, color: 'white')
      black_piece = FactoryGirl.create(:piece, row: 3, column: 4, color: 'black')
      
      expect(white_piece.move_to!(black_piece.row, black_piece.column)).to eq(false)
      
    end    


  end

  describe '#obstructed?' do
    it 'returns false for no horizontal obstructions moving to the right' do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)

      expect(piece.obstructed?(0, 5)).to eq(false)
    end

    it 'returns false for no horizontal obstructions moving to the left' do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)

      expect(piece.obstructed?(0, 1)).to eq(false)
    end

    it 'returns true for horizontal obstructions moving to the right' do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)
      FactoryGirl.create(:piece, row: 0, column: 4, game: piece.game)

      expect(piece.obstructed?(0, 5)).to eq(true)
    end

    it 'returns true for horizontal obstructions moving to the left' do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)
      FactoryGirl.create(:piece, row: 0, column: 2, game: piece.game)

      expect(piece.obstructed?(0, 1)).to eq(true)
    end

    it 'returns false for no vertical obstructions moving up' do
      piece = FactoryGirl.create(:piece, row: 3, column: 5)

      expect(piece.obstructed?(6, 5)).to eq(false)
    end

    it 'returns false for no vertical obstructions moving down' do
      piece = FactoryGirl.create(:piece, row: 3, column: 5)

      expect(piece.obstructed?(0, 5)).to eq(false)
    end

    it 'returns true for vertical obstructions moving up' do
      piece = FactoryGirl.create(:piece, row: 3, column: 5)
      FactoryGirl.create(:piece, row: 4, column: 5, game: piece.game)

      expect(piece.obstructed?(6, 5)).to eq(true)
    end

    it 'returns true for vertical obstructions moving down' do
      piece = FactoryGirl.create(:piece, row: 3, column: 5)
      FactoryGirl.create(:piece, row: 1, column: 5, game: piece.game)

      expect(piece.obstructed?(0, 5)).to eq(true)
    end

    it 'returns false for no diagonal obstructions moving up and to the right' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      expect(piece.obstructed?(4, 4)).to eq(false)
    end

    it 'returns false for no diagonal obstructions moving up and to the left' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      expect(piece.obstructed?(4, 0)).to eq(false)
    end

    it 'returns false for no diagonal obstructions moving down and to the right' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      expect(piece.obstructed?(0, 4)).to eq(false)
    end

    it 'returns false for no diagonal obstructions moving down and to the left' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      expect(piece.obstructed?(0, 0)).to eq(false)
    end

    it 'returns true for diagonal obstructions moving up and to the right' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      FactoryGirl.create(:piece, row: 3, column: 3, game: piece.game)

      expect(piece.obstructed?(4, 4)).to eq(true)
    end

    it 'returns true for diagonal obstructions moving up and to the left' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      FactoryGirl.create(:piece, row: 3, column: 1, game: piece.game)

      expect(piece.obstructed?(4, 0)).to eq(true)
    end

    it 'returns true for diagonal obstructions moving down and to the right' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      FactoryGirl.create(:piece, row: 1, column: 3, game: piece.game)

      expect(piece.obstructed?(0, 4)).to eq(true)
    end

    it 'returns true for diagonal obstructions moving down and to the left' do
      piece = FactoryGirl.create(:piece, row: 2, column: 2)
      FactoryGirl.create(:piece, row: 1, column: 1, game: piece.game)

      expect(piece.obstructed?(0, 0)).to eq(true)
    end

    it 'returns false when there is a piece at the destination and none in between' do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)
      FactoryGirl.create(:piece, row: 0, column: 5, game: piece.game)

      expect(piece.obstructed?(0, 5)).to eq(false)
    end

    it "returns false if piece doesn't move" do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)

      expect(piece.obstructed?(0, 3)).to eq(false)
    end

    it 'raises an error message if input is invalid' do
      piece = FactoryGirl.create(:piece, row: 0, column: 3)

      expect { piece.obstructed?(2, 4) }.to raise_error('Input is invalid!')
    end
  end
end
