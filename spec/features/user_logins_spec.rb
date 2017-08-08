require 'rails_helper'

RSpec.feature "UserLogins",  type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    @user = User.create!(name: "First", lname: "Last", email: "new@example.com", password: "password", password_confirmation: "password")

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

  scenario "They see product details" do
    # ACT
    visit '/login'

    save_screenshot('login.png')

    fill_in 'email', with: 'new@example.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'
    sleep 5

    # VERIFY
    page.first('nav li.user-links').text.should include('Welcome, First Last')

    # DEBUG
    save_screenshot('login_home.png')
  end

end
