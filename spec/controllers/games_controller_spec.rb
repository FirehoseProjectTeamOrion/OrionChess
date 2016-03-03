require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  let!(:game) { FactoryGirl.create(:game) }

  describe 'PUT #forfeit' do
    it 'should return success' do
      put :forfeit, id: game.id

      expect(response).to have_http_status(:ok)
    end
  end
end
