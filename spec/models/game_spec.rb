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
end
