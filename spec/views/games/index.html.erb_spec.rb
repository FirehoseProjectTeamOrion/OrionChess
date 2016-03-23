require 'rails_helper'

RSpec.describe 'games/index.html.erb', type: :view do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
    @users_game = FactoryGirl.create(:game, white_player: user, black_player: nil)
    @unavailable_game = FactoryGirl.create(:game)
    @available_game = FactoryGirl.create(:game, black_player: nil)
    assign(:available_games, Game.available(user))
    assign(:users_games, Game.users_games(user))
  end

  it 'shows one available game' do
    render

    expect(rendered).to have_tag('div#available-games') do
      with_tag 'div.game', count: 1
    end
  end

  it 'shows option to join and not resume available games' do
    render

    expect(rendered).to have_tag('div.container') do
      with_tag 'div#available-games' do
        with_tag 'div.game' do
          with_tag 'div.options' do
            with_tag 'a', text: 'Join'
          end
        end
      end
    end
  end

  it 'shows one user game' do
    render

    expect(rendered).to have_tag('div#users-games') do
      with_tag 'div.game', count: 1
    end
  end

  it 'shows option to resume and not join user games' do
    render

    expect(rendered).to have_tag('div.container') do
      with_tag 'div#users-games' do
        with_tag 'div.game' do
          with_tag 'div.options' do
            with_tag 'a', text: 'Resume'
          end
        end
      end
    end
  end
end
