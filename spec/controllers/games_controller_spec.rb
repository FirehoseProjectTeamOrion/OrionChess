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

  describe '#create' do
    let!(:user) { FactoryGirl.create(:user) }
    it 'should create a game' do
      post :create, color: 'white', user_id: user

      expect(Game.exists?).to eq(true)
    end

    it 'should make assign the current user to be the black when user selects black as their color' do
      post :create, color: 'black', user_id: user

      expect(Game.first.black_player.id).to eq(user.id)
    end

    it 'should make assign the current user to be the white when user selects black as their color' do
      post :create, color: 'white', user_id: user

      expect(Game.first.white_player.id).to eq(user.id)
    end
  end
end
