require 'spec_helper'

feature 'Moving pieces', js: true do
  background do
    allow_any_instance_of(Game).to receive(:populate_board!).and_return true
  end

  given(:game) { FactoryGirl.create(:game) }

  scenario 'Dragging a piece(black_pawn) to a valid location' do
    game.pieces << FactoryGirl.create(:black_pawn, type: 'Pawn')
    visit game_path(game)
    black_pawn = page.find('.ui-draggable', text: 'o')
    destination = page.find('tr:nth-child(3) td:nth-child(5)')
    black_pawn.drag_to(destination)
    wait_for_ajax

    expect(page).to have_css('tr:nth-child(3) td:nth-child(5) span', text: 'o')
    expect(game.pieces.first.row).to eq(2)
  end

  scenario 'Dragging a piece(black_pawn) to an invalid location' do
    game.pieces << FactoryGirl.create(:black_pawn, type: 'Pawn')
    visit game_path(game)
    black_pawn = page.find('.ui-draggable', text: 'o')
    destination = page.find('tr:nth-child(3) td:nth-child(3)')
    black_pawn.drag_to(destination)
    wait_for_ajax

    expect(page).to have_css('tr:nth-child(2) td:nth-child(5) span', text: 'o')
    expect(game.pieces.first.row).to eq(1)
  end
end
