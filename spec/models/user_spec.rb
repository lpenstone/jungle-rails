
require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "ensures a user is validated when password confirmation is a match" do
      # User password confirmation must match password
      @user1 = User.new(name: "First", lname: "Last", email: "new@example.com", password: "passwordTest", password_confirmation: "passwordTestFalse")
      assert @user1.invalid?
      expect(@user1.errors.full_messages).to include("Password confirmation doesn't match Password")

      # User must enter a password confirmation
      @user2 = User.new(name: "First", lname: "Last", email: "new@example.com", password: "passwordTest", password_confirmation: nil)
      assert @user2.invalid?
      expect(@user2.errors.full_messages).to include("Password confirmation can't be blank")

      @user1.password_confirmation = "passwordTest"
      assert @user1.valid?
    end

    it "ensures a user enters a password" do
      # A password must be entered
      @user = User.new(name: "First", lname: "Last", email: "new@example.com", password: nil, password_confirmation: nil)
      assert @user.invalid?
      expect(@user.errors.full_messages).to include("Password can't be blank")

      @user.password = "passwordTest"
      @user.password_confirmation = "passwordTest"
      assert @user.valid?
    end

    it "ensures a user enters a unique email" do
      @user1 = User.new(name: "First", lname: "Last", email: "existing@example.com", password: "password", password_confirmation: "password")
      @user1.save

      #Test unique e-mail address
      @user2 = User.new(name: "First", lname: "Last", email: "existing@example.com", password: "password", password_confirmation: "password")
      assert @user2.invalid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")

      #Test case-sensitivity
      @user3 = User.new(name: "First", lname: "Last", email: "Existing@example.COM", password: "password", password_confirmation: "password")
      assert @user3.invalid?
      expect(@user3.errors.full_messages).to include("Email has already been taken")

      @user2.email = "new@exmaple.com"
      assert @user2.valid?
    end

    it "ensures required fields are filled" do
      @user = User.new(password: "password", password_confirmation: "password")
      assert @user.invalid?
      expect(@user.errors.full_messages).to include("Name can't be blank", "Email can't be blank", "Lname can't be blank")
    end

    it "ensures password is minimum length of 5" do
      @user = User.new(name: "First", lname: "Last", email: "new@example.com", password: "four", password_confirmation: "four")
      assert @user.invalid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

  end

  describe '.authenticate_with_credentials' do

    it "should not match if user does not exist in database" do
      expect(User.authenticate_with_credentials("notexisting@example.com", "password")).to eq(nil)
    end

    it "should not match if email or password is blank" do
      expect(User.authenticate_with_credentials(nil, "password")).to eq(nil)
      expect(User.authenticate_with_credentials("notexisting@example.com", nil)).to eq(nil)
    end

    it "should match if user does exist in database" do
      expect(User.authenticate_with_credentials("email@example.com", "password")).to eq(@user)
    end

    it "should not match if user does exist but password is incorrect" do
      expect(User.authenticate_with_credentials("email@example.com", nil)).to eq(nil)
    end

    it "should match if user does exist with case insensitivities" do
      expect(User.authenticate_with_credentials("emAil@example.cOm", "password")).to eq(@user)
    end

    it "should match if user does exist with space insensitivities" do
      expect(User.authenticate_with_credentials("    emAil@example.cOm  ", "password")).to eq(@user)
    end

    before :each do
      @user = User.new(name: "First", lname: "Last", email: "email@example.com", password: "password", password_confirmation: "password")
      @user.save
    end

  end

end
