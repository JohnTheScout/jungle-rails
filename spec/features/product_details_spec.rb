require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do
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

  scenario 'they see the details page' do
    visit root_path
    visit product_path rand(1..10)
    #save_screenshot
    expect(page).to have_css 'section.products-show'
  end
end
