require 'rails_helper'

feature "User searches" do
  before {
    visit root_path
    create(:gif, title: 'Super awesome gif image', tag_list: 'Cool, Great, Awesome')
  }

  scenario "with existing tag" do
    fill_in 'Search', with: 'Awesome'
    click_button 'Find Gifs'

    expect(page).to have_content('Super awesome gif image')
  end

  scenario "with non-existant tag" do
    fill_in 'Search', with: 'blah'
    click_button 'Find Gifs'

    expect(page).to have_content("Sorry, we couldn't find any gifs tagged with \"blah\".")
  end
end
