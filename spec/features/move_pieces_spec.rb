require 'spec_helper'

feature 'Draggable and droppable functionality', js: true do
  given(:user) {FactoryGirl.create(:user)}

  scenario 'Dragging a piece to a new location' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
