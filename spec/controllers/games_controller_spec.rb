require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe '#forfeit' do
    let!(:game) { FactoryGirl.create(:game) }

    it 'should redirect to game show page' do
      put :forfeit, id: game.id, user_id: game.white_player.id

      expect(response).to redirect_to(game_path(game))
    end
  end

  describe '#promote_pawn' do
    before do
      allow_any_instance_of(Game).to receive(:populate_board!).and_return true
    end

    let!(:game) { FactoryGirl.create(:game) }
    let!(:pawn) { FactoryGirl.create(:black_pawn, type: 'Pawn', row: 7, game: game) }

    it 'should return ok' do
      put :promote_pawn, id: game.id, pawn_id: pawn.id, promotion_type: 'Queen'

      expect(response).to have_http_status(:ok)
    end
  end
end
