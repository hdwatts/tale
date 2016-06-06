require 'rails_helper'

RSpec.describe Tale, type: :model do
  context 'creates a valid tale' do
  let (:user) { User.create!(first_name: "R", last_name: "Spec", username: "rspec", email: "r@spec.com", password: "password", password_confirmation: "password") }
  let (:tale) { Tale.create!(prompt: "Now I am telling a story let me tell you", owner_id: user.id, lines_attributes: {"0"=> {content: "this is the first line", user_id: user.id, done: true}}) }

    it 'has a prompt of at least 10 characters' do
      tale.prompt.length > 10
    end

    it 'has an open status upon creation' do
      tale.open == true
    end

    it 'has a first line created by the owner' do
      tale.lines.first.user_id = tale.owner_id
    end
    
    it 'displays the new tale with prompt, owner name and the first line' do
      visit "/tales/#{tale.id}"
      page.should have_content('Now I am telling a story')
      page.should have_content('the first line')
      page.should have_content('rspec')
    end  

  end
end

