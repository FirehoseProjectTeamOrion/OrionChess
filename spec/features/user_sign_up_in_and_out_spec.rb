require 'rails_helper'

feature 'User Sign up and Sign in' do
  background do
    @user = FactoryGirl.create(:user)
  end

  scenario 'Successfully sign up user' do
    visit root_path
    within('#wrap') do
      click_link 'Sign up'
    end
    within('#signup .form-inputs') do
      fill_in 'Username', with: 'username'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    end
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Successfully sign in with email' do
    visit root_path
    click_link 'Sign in'
    within('#signin .form-inputs') do
      fill_in 'Login', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Successfully sign in with username' do
    visit root_path
    click_link 'Sign in'
    within('#signin .form-inputs') do
      fill_in 'Login', with: @user.username
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Fail sign in for invalid user info' do
    visit root_path
    click_link 'Sign in'
    within('#signin .form-inputs') do
      fill_in 'Login', with: 'wrongUsername'
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign in'

    expect(page).to have_content 'Invalid login or password'
  end
end
