require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  before do
    allow_any_instance_of(Game).to receive(:populate_board!).and_return true
  end
  let(:game) { FactoryGirl.create(:game) }
  let(:pawn) { FactoryGirl.create(:black_pawn, type: 'Pawn', game: game) }

  describe 'PUT #update' do
    it "updates the piece's row and column for a valid move" do
      put :update, id: pawn.id, piece: { row: 3, column: 4 }

      expect(game.pieces.first.row).to eq(3)
      expect(game.pieces.first.column).to eq(4)
    end

    it 'returns an error for invalid move' do
      put :update, id: pawn.id, piece: { row: 4, column: 4 }

      expect(response).to have_http_status(:bad_request)
    end
  end
end
