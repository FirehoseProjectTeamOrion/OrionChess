require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PiecesHelper. For example:
#
# describe PiecesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PiecesHelper, type: :helper do
    describe '#draw_piece' do
    let(:game) { FactoryGirl.create(:game) }
    let(:cur_piece) { game.pieces.find_by(row: 6, column: 1) }

    it 'returns a blank link to the pieces update action when there is no piece at the given location' do
      expect(helper.pieces_draw_piece(cur_piece, 4, 4)).to include("")
      expect(helper.pieces_draw_piece(cur_piece, 4, 4)).to include("data-method=\"put\"")
    end

    it "returns 'p' as a link with the id selected when it is the currently selected piece" do
      expect(helper.pieces_draw_piece(cur_piece, 6, 1)).to include('p')
      expect(helper.pieces_draw_piece(cur_piece, 6, 1)).to include(piece_path(cur_piece))
      expect(helper.pieces_draw_piece(cur_piece, 6, 1)).to include("id=\"selected\"")
    end

    it "returns 'p' as normal link when it is not the currently selected piece" do
      expect(helper.pieces_draw_piece(cur_piece, 6, 2)).to include('p')
      expect(helper.pieces_draw_piece(cur_piece, 6, 2)).to include(piece_path(game.pieces.find_by(row: 6, column: 2)))
      expect(helper.pieces_draw_piece(cur_piece, 6, 2)).not_to include("id=\"selected\"")
    end
  end
end
