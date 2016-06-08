require "rails_helper"

RSpec.describe "Feature" do 

  describe "the add line process", :type => :feature do
    before :each do
      @dean = User.create(first_name: "Dean", last_name: "Watts", username: "hdwatts", email: "dean@tales.com", password: "password1" )
      @alex = User.create(first_name: "Alex", last_name: "Martin", username: "asmartin", email: "alex@tales.com", password: "password1" )
      @tale = Tale.create(title: "My Title", prompt: "This is a test of a story prompt", owner: @dean)
      @line = Line.create(user: @dean, tale: @tale, content: "Wow I wrote a line or two", done: true)
      @tale2 = Tale.create(title: "My Title", prompt: "This is a test of a story prompt 2", owner: @alex)
      @line2 = Line.create(user: @alex, tale: @tale2, content: "Wow I wrote a line or two 2", done: true)
    end


    it "can not participate in tale where he is the last line author" do
      sign_in
      visit "/tales/#{@tale.id}"
      expect(page).not_to have_content 'Participate in this Tale'
    end

    it "can participate in tale where he is not the last line author" do
      sign_in
      visit "/tales/#{@tale2.id}"
      expect(page).to have_content 'Participate in this Tale'
    end

  end
end
