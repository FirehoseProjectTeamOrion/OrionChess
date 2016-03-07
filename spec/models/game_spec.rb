require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#populate_board!' do
    it 'creates a black Knight' do
      game = Game.create
      expect(game.pieces(color: 'black').find_by(row: 0, column: 1)).to be_a Knight
    end

    it 'creates 32 pieces' do
      game = Game.create
      expect(game.pieces.count).to eq 32
    end
  end

  describe '#check?' do
    before do
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    let(:game) { FactoryGirl.create(:game) }
    let(:white_king) { FactoryGirl.create(:king, type: 'King', color: 'white', row: 7, column: 3) }
    let(:black_king) { FactoryGirl.create(:king, type: 'King', color: 'black', row: 0, column: 3) }

    it 'returns true if white player is in check' do
      game.pieces << white_king
      game.pieces << black_king
      game.pieces << FactoryGirl.create(:queen, type: 'Queen', color: 'black', row: 2, column: 3)

      expect(game.check?).to eq(true)
    end

    it 'returns true if black player is in check' do
      game.pieces << white_king
      game.pieces << black_king
      game.pieces << FactoryGirl.create(:knight, type: 'Knight', color: 'white', row: 2, column: 4)

      expect(game.check?).to eq(true)
    end

    it 'returns false if neither player is in check' do
      game.pieces << white_king
      game.pieces << black_king
      game.pieces << FactoryGirl.create(:black_pawn, type: 'Pawn', row: 6, column: 3)
      game.pieces << FactoryGirl.create(:queen, type: 'Queen', color: 'black', row: 5, column: 2)
      game.pieces << FactoryGirl.create(:knight, type: 'Knight', color: 'white', row: 1, column: 4)
      game.pieces << FactoryGirl.create(:queen, type: 'Queen', color: 'white', row: 2, column: 2)

      expect(game.check?).to eq(false)
    end
  end

  describe '#stalemate?' do
    before do
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    let(:game) { FactoryGirl.create(:game) }
    let(:white_king) { FactoryGirl.create(:king, type: 'King', color: 'white', row: 7, column: 3) }
    let(:black_king) { FactoryGirl.create(:king, type: 'King', color: 'black', row: 0, column: 3) }

    it 'return true if neither king is in check and player doesnt have any more move' do
      game.pieces << white_king
      game.pieces << black_king
      game.pieces << FactoryGirl.create(:black_pawn, type: 'Pawn', row: 6, column: 3)
      game.pieces << FactoryGirl.create(:white_pawn, type: 'Pawn', row: 1, column: 3)

      expect(game.stalemate?).to eq(true)
    end

    it 'return false if either king is in check or player do have any more move' do
      game.pieces << white_king
      game.pieces << black_king
      game.pieces << FactoryGirl.create(:black_pawn, type: 'Pawn', row: 6, column: 3)
      game.pieces << FactoryGirl.create(:white_pawn, type: 'Pawn', row: 1, column: 3)

      expect(game.stalemate?).to eq(true)
    end
  end

  describe '#available_move?' do
    before do
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    let(:game) { FactoryGirl.create(:game) }
    let(:white_king) { FactoryGirl.create(:king, type: 'King', color: 'white', row: 7, column: 3) }
    let(:black_king) { FactoryGirl.create(:king, type: 'King', color: 'black', row: 0, column: 3) }

    it 'return true if neither king is in check and player doesnt have any more move' do
      game.pieces << white_king
      game.pieces << black_king
      game.pieces << FactoryGirl.create(:black_pawn, type: 'Pawn', row: 6, column: 3)
      game.pieces << FactoryGirl.create(:white_pawn, type: 'Pawn', row: 1, column: 3)

      expect(game.stalemate?).to eq(true)
    end

    it 'return false if either king is in check or player do have any more move' do
      game.pieces << white_king
      game.pieces << black_king
      game.pieces << FactoryGirl.create(:black_pawn, type: 'Pawn', row: 6, column: 3)
      game.pieces << FactoryGirl.create(:white_pawn, type: 'Pawn', row: 1, column: 3)

      expect(game.stalemate?).to eq(true)
    end
  end
end
