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

  describe '#pass_turn' do
    let(:game) { FactoryGirl.create(:game) }

    it 'ends the current_player\'s turn and passes the turn the the other player' do
      game.active_player = game.white_player

      game.pass_turn(game.white_player)
      expect(game.active_player).to eq(game.black_player)
    end
  end
end
