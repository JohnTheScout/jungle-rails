require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  #SETUP
  before :each do
    @cat = Category.create! name: 'Apparel'

    10.times do |n|
      @cat.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'the cart icon is updated' do
    #ACT
    visit root_path
    click_on 'Add', match: :first
    #DEBUG
    save_screenshot
    #VERIFY
    within('nav') { expect(page).to have_content 'My Cart (1)' }
  end
end
