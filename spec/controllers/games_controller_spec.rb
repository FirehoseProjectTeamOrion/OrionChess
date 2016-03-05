require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:game) { FactoryGirl.create(:game) }

  describe '#forfeit' do
    it 'should return success' do
      put :forfeit, id: game.id, user_id: game.white_player.id

      expect(response).to redirect_to(game_path(game))
    end
  end
end
