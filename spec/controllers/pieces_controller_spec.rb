require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  let(:game) { FactoryGirl.create(:game) }

  describe 'GET #update' do
    it "updates the piece's row and column" do
      get :update, id: game.pieces.first.id, piece: { row: 4, column: 4 }

      expect(game.pieces.first.row).to eq(4)
      expect(game.pieces.first.column).to eq(4)
    end
  end
end
