module AuthHelpers
  def admin_login
    @admin ||= create(:admin)
    visit new_admin_session_path
    fill_in 'Email', with: @admin.email
    fill_in 'Password', with: 'samplepassword'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end

RSpec.configure { |c| c.include AuthHelpers }
