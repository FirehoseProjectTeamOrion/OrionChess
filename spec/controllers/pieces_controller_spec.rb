require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  before do
    allow_any_instance_of(Game).to receive(:populate_board!).and_return true
  end
  let(:game) { FactoryGirl.create(:game) }
  let(:black_pawn) { FactoryGirl.create(:black_pawn, type: 'Pawn', game: game) }

  describe 'PUT #update' do
    it "updates the piece's row and column for a valid move" do
      put :update, id: black_pawn.id, piece: { row: 3, column: 4 }, format: :json

      black_pawn.reload
      expect(black_pawn.row).to eq(3)
      expect(black_pawn.column).to eq(4)
    end

    it 'updates the pieces row and column and removes oppoent on capture' do
      white_pawn = FactoryGirl.create(:white_pawn, type: 'Pawn', game: game, row: 2, column: 3)

      put :update, id: black_pawn.id, piece: { row: 2, column: 3 }, format: :json

      black_pawn.reload
      white_pawn.reload

      expect(black_pawn.row).to eq(2)
      expect(black_pawn.column).to eq(3)
      expect(white_pawn.in_game).to eq(false)
    end

    it 'returns an error for invalid move' do
      put :update, id: black_pawn.id, piece: { row: 4, column: 4 }, format: :json

      expect(response).to have_http_status(:bad_request)
    end
  end
end
