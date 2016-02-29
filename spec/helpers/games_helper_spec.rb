require 'rails_helper'

RSpec.describe GamesHelper, type: :helper do
  describe '#draw_piece' do
    let(:game) { FactoryGirl.create(:game) }

    it 'returns nil when there is no piece at the given location' do
      expect(helper.draw_piece(game, 4, 4)).to eq(nil)
    end

    it "returns 'p' as a link to pieces page when there is a white pawn at the given location" do
      expect(helper.draw_piece(game, 6, 1)).to include('p')
      expect(helper.draw_piece(game, 6, 1)).to include(piece_path(game.pieces.find_by(row: 6, column: 1)))
    end

    it "returns 'o' when there is a black pawn at the given location" do
      expect(helper.draw_piece(game, 1, 6)).to include('o')
      expect(helper.draw_piece(game, 1, 6)).to include(piece_path(game.pieces.find_by(row: 1, column: 6)))
    end

    it "returns 'n' when there is a white knight at the given location" do
      expect(helper.draw_piece(game, 7, 1)).to include('n')
      expect(helper.draw_piece(game, 7, 1)).to include(piece_path(game.pieces.find_by(row: 7, column: 1)))
    end

    it "returns 'm' when there is a black knight at the given location" do
      expect(helper.draw_piece(game, 0, 6)).to include('m')
      expect(helper.draw_piece(game, 0, 6)).to include(piece_path(game.pieces.find_by(row: 0, column: 6)))
    end

    it "returns 'b' when there is a white bishop at the given location" do
      expect(helper.draw_piece(game, 7, 2)).to include('b')
      expect(helper.draw_piece(game, 7, 2)).to include(piece_path(game.pieces.find_by(row: 7, column: 2)))
    end

    it "returns 'v' when there is a black bishop at the given location" do
      expect(helper.draw_piece(game, 0, 5)).to include('v')
      expect(helper.draw_piece(game, 0, 5)).to include(piece_path(game.pieces.find_by(row: 0, column: 5)))
    end

    it "returns 'r' when there is a white rook at the given location" do
      expect(helper.draw_piece(game, 7, 0)).to include('r')
      expect(helper.draw_piece(game, 7, 0)).to include(piece_path(game.pieces.find_by(row: 7, column: 0)))
    end

    it "returns 't' when there is a black rook at the given location" do
      expect(helper.draw_piece(game, 0, 7)).to include('t')
      expect(helper.draw_piece(game, 0, 7)).to include(piece_path(game.pieces.find_by(row: 0, column: 7)))
    end

    it "returns 'q' when there is a white queen at the given location" do
      expect(helper.draw_piece(game, 7, 3)).to include('q')
      expect(helper.draw_piece(game, 7, 3)).to include(piece_path(game.pieces.find_by(row: 7, column: 3)))
    end

    it "returns 'w' when there is a black queen at the given location" do
      expect(helper.draw_piece(game, 0, 3)).to include('w')
      expect(helper.draw_piece(game, 0, 3)).to include(piece_path(game.pieces.find_by(row: 0, column: 3)))
    end

    it "returns 'k' when there is a white king at the given location" do
      expect(helper.draw_piece(game, 7, 4)).to include('k')
      expect(helper.draw_piece(game, 7, 4)).to include(piece_path(game.pieces.find_by(row: 7, column: 4)))
    end

    it "returns 'l' when there is a black king at the given location" do
      expect(helper.draw_piece(game, 0, 4)).to include('l')
      expect(helper.draw_piece(game, 0, 4)).to include(piece_path(game.pieces.find_by(row: 0, column: 4)))
    end
  end
end
