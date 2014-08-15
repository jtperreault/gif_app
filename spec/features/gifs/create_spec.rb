require 'rails_helper'

feature 'Admin creates gif' do
  before {
    admin_login
    visit new_gif_path
  }

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Funniest Gif EVAR!1'
    fill_in 'Url',   with: 'http://www.gifstore.fake/funniest.gif'
    fill_in 'Tags',  with: 'funny, hillarious'

    click_button 'Save Gif'
    expect(page).to have_content('Funniest Gif EVAR!1')
    expect(page).to have_content('Tags: funny, hillarious')
  end

  scenario 'with invalid attributes' do
    fill_in 'Title', with: ''
    fill_in 'Url',   with: ''
    fill_in 'Tags',  with: ''

    click_button 'Save Gif'
    expect(page).to have_content('Title can\'t be blank!')
    expect(page).to have_content('Url can\'t be blank!')
    expect(page).to have_content('Tag list can\'t be blank!')
    expect(page).to have_content('Url is not an url!')
  end
end
