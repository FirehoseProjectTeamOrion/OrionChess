require 'spec_helper'

feature 'Moving pieces', js: true do
  given(:game) {FactoryGirl.create(:game)}

  scenario 'Dragging a piece(black king) to a new location' do
    visit game_path(game)
    black_king = page.find('.ui-draggable', text: 'l')
    destination = page.find('tr:nth-child(2) td:nth-child(3)')
    black_king.drag_to(destination)

    expect(page).to have_css('tr:nth-child(2) td:nth-child(3) span', text: 'l')
  end
end
