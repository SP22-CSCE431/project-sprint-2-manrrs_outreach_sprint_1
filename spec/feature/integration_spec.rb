# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a message', type: :feature do
  scenario 'valid inputs' do
    visit messages_path
    click_on 'Send a Text'
    fill_in 'textmsg', with: 'new msg'
    click_on 'Send'
    visit "/messages"
    expect(page).to have_content('new msg')
  end
end