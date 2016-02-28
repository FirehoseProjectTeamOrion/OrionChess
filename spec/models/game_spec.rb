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

    let(:game) {FactoryGirl.create(:game)}

    it 'returns true if white player is in check' do
      game.pieces << FactoryGirl.create(:king, color: 'white', row: 5, column: 3)
      game.pieces << FactoryGirl.create(:queen, color: 'black', row: 2, column: 3)

      expect(game.check?).to eq(true)
    end

    it 'returns true if black player is in check' do
      game.pieces << FactoryGirl.create(:king, color: 'black')
      game.pieces << FactoryGirl.create(:knight, color: 'white', row: 2, column: 5)

      expect(game.check?).to eq(true)
    end

    it 'returns false if neither player is in check' do
      game.pieces << FactoryGirl.create(:king, color: 'black', row: 0, column: 3)
      game.pieces << FactoryGirl.create(:king, color: 'white', row: 7, column: 3)
      game.pieces << FactoryGirl.create(:black_pawn, row: 6, column:3)
      game.pieces << FactoryGirl.create(:queen, color: 'black', row: 5, column: 2)
      game.pieces << FactoryGirl.create(:knight, color: 'white', row: 1, column: 4)
      game.pieces << FactoryGirl.create(:queen, color: 'white', row: 2, column: 2)

      expect(game.check?).to eq(false)
    end
  end
end
