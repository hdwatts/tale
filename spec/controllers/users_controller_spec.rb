require 'rails_helper'

RSpec.describe "UsersController" do

  describe "the user page", type: :feature do
    before :each do
      @dean = User.create(first_name: "Dean", last_name: "Watts", username: "hdwatts", email: "dean@tales.com", password: "password1" )
      @alex = User.create(first_name: "Alex", last_name: "Martin", username: "asmartin", email: "alex@tales.com", password: "password1" )
      @tale = Tale.create(title: "My Title", prompt: "This is a test of a story prompt", owner: @dean)
      @line = Line.create(user: @dean, tale: @tale, content: "Wow I wrote a line or two", done: true)
      @tale2 = Tale.create(title: "My Title", prompt: "This is a test of a story prompt 2", owner: @alex)
      @line2 = Line.create(user: @alex, tale: @tale2, content: "Wow I wrote a line or two 2", done: true)
    end

    it "can signup" do
      visit "/signup"
      fill_in('user_first_name', with: "gary")
      fill_in('user_last_name', with: "williams")
      fill_in('user_username', with: "garywilliams")
      fill_in('user_email', with: "gary@williams.com")
      fill_in('user_password', with: "password1")
      fill_in('user_password_confirmation', with: "password1")
      click_button("Sign Up")
      expect(page).to have_content "garywilliams"
    end

    it "has errors on signup" do
      visit "/signup"
      fill_in('user_first_name', with: "gary")
      fill_in('user_last_name', with: "williams")
      fill_in('user_username', with: "garywilliams")
      fill_in('user_email', with: "gary@williams.com")
      fill_in('user_password', with: "")
      fill_in('user_password_confirmation', with: "")
      click_button("Sign Up")
      expect(page).to have_content "Already have an account?"
    end

    it "can edit" do
      sign_in
      visit "/users/#{@dean.id}/edit"
      fill_in('user_first_name', with: "Dean2")
      click_button("Confirm Changes")
      expect(page).to have_content "Dean2"
    end

    it "can break on edit" do
      sign_in
      visit "/users/#{@dean.id}/edit"
      fill_in('user_email', with: "alex@tales.com")
      click_button("Confirm Changes")
      expect(page).to have_content "Email has already been taken"
    end
  end
end