# location: spec/feature/integration_spec.rb
require 'rails_helper'
Capybara.run_server = true 
Capybara.server_port = 3000
Capybara.app_host = "http://localhost:#{Capybara.server_port}" 

RSpec.describe 'Creating a message', type: :feature do
  scenario 'valid inputs' do
    visit messages_path
    click_on 'Send a Text'
    fill_in 'textmsg', with: '123123123'
    expect(page).to have_field('textmsg', with: '123123123')
    click_on 'Send'
    visit '/messages'
    expect(page).to have_content('123123123')
  end
end