require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  let(:game) { FactoryGirl.create(:game) }

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: game.pieces.first.id
      expect(response).to have_http_status(:success)
    end

    it 'assigns a value to @piece' do
      get :show, id: game.pieces.first.id

      expect(assigns(:piece)).to eq(game.pieces.first)
    end
  end

  describe 'GET #update' do
    it "updates the piece's row and column" do
      get :update, id: game.pieces.first.id, piece: { row: 4, column: 4 }

      expect(game.pieces.first.row).to eq(4)
      expect(game.pieces.first.column).to eq(4)
    end

    it 'redirects to the game show page' do
      get :update, id: game.pieces.first.id, piece: { row: 4, column: 4 }

      expect(game.pieces.first.row).to redirect_to(game_path(game))
    end
  end
end
