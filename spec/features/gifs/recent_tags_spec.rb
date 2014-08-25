require 'rails_helper'

feature "Recent tags" do

  let!(:gif1) { create(:gif, title: 'The first Gif', tag_list: 'One') }

  before {
    visit root_path
  }

  scenario "when viewing Search index" do
    expect(page).to have_content('Recent Tags: ')
    expect(page).to have_content('One')
  end

  scenario "when clicking a recent Tag" do
    click_link 'One'
    expect(page).to have_content('The first Gif')
  end
end
