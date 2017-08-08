require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add to cart" do
    # ACT
    visit root_path

    page.first("footer a").click
    sleep 5

    # VERIFY
    page.first('#cart').text.should match('My Cart (1)')

    # DEBUG
    save_screenshot('add_to_cart.png')

    end
end
