require "rails_helper"

RSpec.describe "TalesController" do 

    before :each do
      @dean = User.create(first_name: "Dean", last_name: "Watts", username: "hdwatts", email: "dean@tales.com", password: "password1" )
      @alex = User.create(first_name: "Alex", last_name: "Martin", username: "asmartin", email: "alex@tales.com", password: "password1" )
      @tale = Tale.create(title: "My Title", prompt: "This is a test of a story prompt", owner: @dean)
      @line = Line.create(user: @dean, tale: @tale, content: "Wow I wrote a line or two", done: true)
      @tale2 = Tale.create(title: "My Title", prompt: "This is a test of a story prompt 2", owner: @alex)
      @line2 = Line.create(user: @alex, tale: @tale2, content: "Wow I wrote a line or two 2", done: true)
    end  

  describe "Creating tales" do
    it "Form has a new, empty tale" do
      sign_in
      visit "/tales/new"
      expect(page).to have_css('form.new_tale')
    end
    
    it "Form has ability to create first line" do
      sign_in
      visit "/tales/new"
      expect(page).to have_css('#newtaleline')
    end

    it "Form has ability to initialize tags" do
      sign_in
      visit "/tales/new"
      expect(page).to have_css('#tale_tag_name')
    end
    
    # it "Saves and displays tales after creation" do
    #   sign_in
    #   visit "/tales/new"
    #    #find('input#newtaletitle').set('My Title')
    #    fill_in 'newtaletitle', :with => 'some text'
    #   # expect(page).to have_content(tale3.title)
    # end
  end

  describe "Viewing tales" do
    it "Index displays all tales" do
      visit "/tales/"
      expect(page).to have_content(@tale2.title.capitalize)
    end

  end
end