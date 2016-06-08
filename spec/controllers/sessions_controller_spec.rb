require 'rails_helper'

RSpec.describe "SessionsController" do

  describe "the signin page", type: :feature do
    before :each do
      @dean = User.create(first_name: "Dean", last_name: "Watts", username: "hdwatts", email: "dean@tales.com", password: "password1" )
      @alex = User.create(first_name: "Alex", last_name: "Martin", username: "asmartin", email: "alex@tales.com", password: "password1" )
      @tale = Tale.create(title: "My Title", prompt: "This is a test of a story prompt", owner: @dean)
      @line = Line.create(user: @dean, tale: @tale, content: "Wow I wrote a line or two", done: true)
      @tale2 = Tale.create(title: "My Title", prompt: "This is a test of a story prompt 2", owner: @alex)
      @line2 = Line.create(user: @alex, tale: @tale2, content: "Wow I wrote a line or two 2", done: true)
    end

    it "can sign in" do
      sign_in
      visit "/users/#{@dean.id}"
      expect(page).to have_content "Tales I Own"
    end

    it "can sign out" do
      sign_in
      click_link("Log Out")
      visit "/users/#{@dean.id}"
      expect(page).not_to have_content "Tales I Own"
    end

    it "alerts user to wrong sign in" do
      visit '/sessions/new'
      fill_in('user_username', with: "break")
      fill_in('user_password', with: "thefcode")
      click_button("Sign In")
      expect(page).to have_content "Invalid username or password"
    end
  end
end