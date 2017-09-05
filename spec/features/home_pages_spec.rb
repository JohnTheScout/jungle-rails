require 'rails_helper'

RSpec.feature "Vistor navigates to home page", type: :feature, js: true do
  scenario 'they see all products' do 
    visit root_path
    save_screenshot
  end
end
