require 'rails_helper'

feature 'Admin updates gif' do
  let!(:resource) { create(:gif, title: 'Gif Title', tag_list: 'one, two, three') }

  before {
    admin_login
    visit edit_gif_path(resource)
  }

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Gif Name'
    fill_in 'Tags',  with: 'four, five, six'

    click_button 'Save Gif'
    expect(page).to have_content('Gif updated successfully!')
    expect(page).to have_content('Gif Name')
    expect(page).to have_content('Tags: four, five, six')
  end

  scenario 'with invalid attributes' do
    fill_in 'Url', with: 'not_a_valid_url'

    click_button 'Save Gif'
    expect(page).to have_content('"1 error" prevented this gif from being saved:')
    expect(page).to have_content('Url is not an url!')
  end
end
