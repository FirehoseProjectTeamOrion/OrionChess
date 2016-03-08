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

  describe '#forfeit' do
    let(:game) { FactoryGirl.create(:game) }

    it 'should set the other player as the winner' do
      game.forfeit(game.white_player)
      expect(game.winning_player).to eq(game.black_player)
    end

    it 'should end the game' do
      game.forfeit(game.white_player)
      expect(game.over).to eq(true)
    end
  end

  describe '#promote_pawn' do
    before do
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    let(:game) { FactoryGirl.create(:game) }
    let(:pawn) { FactoryGirl.create(:white_pawn, type: 'Pawn', row: 0, game: game) }

    it 'removes the pawn' do
      game.promote_pawn(pawn, 'Queen')

      pawn = game.pieces.find_by(type: 'Pawn')

      expect(pawn.in_game).to eq(false)
    end

    it 'adds a new queen when promoting to queen' do
      game.promote_pawn(pawn, 'Queen')

      expect(game.pieces.find_by(type: 'Queen').exists).to eq(true)
    end

    it 'adds a new knight when promoting to knight' do
      game.promote_pawn(pawn, 'Knight')

      expect(game.pieces.find_by(type: 'Knight').exists).to eq(true)
    end

    it 'adds a new rook when promoting to rook' do
      game.promote_pawn(pawn, 'Rook')

      expect(game.pieces.find_by(type: 'Rook').exists).to eq(true)
    end

    it 'adds a new bishop when promoting to bishop' do
      game.promote_pawn(pawn, 'Bishop')

      expect(game.pieces.find_by(type: 'Bishop').exists).to eq(true)
    end

    it 'only adds one piece' do
      game.promote_pawn(pawn, 'Queen')

      expect(game.pieces.size).to eq(2)
    end
  end
end
