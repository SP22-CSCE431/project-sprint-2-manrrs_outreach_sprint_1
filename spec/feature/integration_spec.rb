# location: spec/feature/integration_spec.rb
require 'rails_helper'
Capybara.run_server = true
Capybara.server_port = 3000
Capybara.app_host = "http://localhost:#{Capybara.server_port}"

# RSpec.describe 'Creating a message', type: :feature do
#   scenario 'valid inputs' do
#     visit messages_path
    # click_on 'Send a Text'
    # fill_in 'textmsg', with: '123123123'
    # expect(page).to have_field('textmsg', with: '123123123')
    # click_on 'Send'
#     visit '/messages'
#     expect(page).to have_content('123123123')
#   end
# end

RSpec.describe 'adding a new carrier', type: :feature do
  scenario 'valid inputs' do
    visit new_carrier_path
    fill_in 'Domain', with: 'sms.myboostmobile.com'
    click_on 'Create Carrier'
    visit carriers_path
    expect(page).to have_content('sms.myboostmobile.com')
    click_on 'Edit'
    fill_in 'Domain', with: 'mms.cricketwireless.net'
    click_on 'Update Carrier'
    visit carriers_path
    expect(page).to have_content('mms.cricketwireless.net')
    click_on 'Destroy'
    # click_on 'OK'
    expect(page).to have_no_content('mms.cricketwireless.net')
  end
end

# RSpec.describe 'message history', type: :feature do
#   scenario 'valid inputs' do
#     visit new_student_path
#     fill_in 'Student id', with: '1234'
#     fill_in 'First name', with: 'asdf'
#     fill_in 'Last name', with: 'asdf'
#     fill_in 'Phone number', with: '1234'
#     fill_in 'Email', with: 'asdf'
#     click_on 'Create Student'
#     visit messages_path
#     click_on 'Send a Text'
#     fill_in 'textmsg', with: '123123123'
#     click_on 'Send'
#     visit message_histories_path
#     expect(page).to have_content('1')
#   end
# end
