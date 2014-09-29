require 'rails_helper'

feature "User views" do
  let!(:gif1) { create(:gif, title: 'Gif One') }
  let!(:gif2) { create(:gif, title: 'Gif Two') }
  let!(:gif3) { create(:gif, title: 'Gif Three') }
  before { visit all_gifs_path }

  scenario "all gifs" do
    expect(page).to have_content('All the Gifs!')
    expect(page).to have_content(gif1.title)
    expect(page).to have_content(gif2.title)
    expect(page).to have_content(gif3.title)
  end
end
