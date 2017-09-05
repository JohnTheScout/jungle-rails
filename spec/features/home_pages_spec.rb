require 'rails_helper'

RSpec.feature "Vistor navigates to home page", type: :feature, js: true do
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

  scenario 'they see all products' do 
    #ACT
    visit root_path
    #DEBUG
    save_screenshot
    #VERIFY
    expect(page).to have_css 'article.product', count: 10
  end
end
