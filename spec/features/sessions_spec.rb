require 'rails_helper'

describe 'User sessions' do
  let(:username) { 'Zack' }
  let(:email) { 'zack@mail.com' }
  let(:fullname) { 'Zakariae El Mejdki' }
  let(:password) { '123456' }

  context 'user unsigned in' do
    before do
      visit new_user_session_path
      fill_in 'Email address', with: 'someone@mail.com'
      fill_in 'Password', with: '320103'
      click_button 'Log in'
    end

    it 'displays an error message' do
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'shows the correct menu links' do
      within('.navbar') do
        expect(page).to have_link('Log In')
        expect(page).to have_link('Register')
      end
    end
  end

  context 'user sign up' do
    it 'displays a welcome message' do
      visit new_user_registration_path
      fill_in 'user_fullname', with: fullname
      fill_in 'user_username', with: username
      fill_in 'user_email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign Up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  context 'user sign in' do
    before do
      visit new_user_session_path
      fill_in 'Email address', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    it 'shows a hello message' do
      expect(page).to have_content('Signed in successfully.')
    end

    it 'shows the correct menu links' do
      within('.navbar') do
        expect(page).to_not have_link('Log In')
        expect(page).to_not have_link('Register')
      end

      within('.menu-list') do
        expect(page).to have_link('Home')
        expect(page).to have_link('Connect')
        expect(page).to have_link('Messages')
        expect(page).to have_link('Profile')
        expect(page).to have_link('Sign Out')
      end
    end

    it 'create a valid post' do
      fill_in 'post_text', with: 'Hello guys it\'s me happy to be here.'
      page.execute_script("document.querySelector('form#new_post').submit()")

      expect(page).to have_content('post was created successfuly.')
    end

    it 'create a none valid post' do
      fill_in 'post_text', with: 'Hi'
      page.execute_script("document.querySelector('form#new_post').submit()")

      expect(page).to have_content('post was not created please try again.')
    end
  end
end
