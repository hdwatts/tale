require 'rails_helper'

RSpec.describe Tale, type: :model do
  context 'creates a valid tale' do
  let (:user) { User.create!(first_name: "R", last_name: "Spec", username: "rspec", email: "r@spec.com", password: "password", password_confirmation: "password") }
  let (:tale) { Tale.create!(title: "My Title", prompt: "Now I am telling a story let me tell you", owner_id: user.id, open: false, lines_attributes: {"0"=> {content: "this is the first line", user_id: user.id, done: true}}) }
  let (:open_tale) { Tale.create!(title: "My Title2", prompt: "Now I am telling a story let me tell you", owner_id: user.id, lines_attributes: {"0"=> {content: "this is the first line", user_id: user.id, done: true}}) }

    it 'has a prompt of at least 10 characters' do
      expect(tale.prompt.length).to be > 10
    end

    it 'has an open status upon creation' do
      expect(open_tale.open).to be(true)
    end

    it 'has a first line created by the owner' do
      expect(tale.lines.first.user_id).to be(tale.owner_id)
    end

    it 'displays the new tale with prompt, owner name and the first line' do
      visit "/tales/#{tale.id}"
      page.should have_content('Now I am telling a story')
      page.should have_content('the first line')
      page.should have_content('rspec')
    end

    it 'can close a tale' do
      tale.close
      expect(tale.open).to be(false)
    end

    it 'can get open tales' do
      tales = Tale.open_tales
      expect(tales).to include(open_tale)
      expect(tales).not_to include(tale)
    end

    it 'can get closed tales' do
      tale.close
      tales = Tale.closed_tales
      expect(tales).not_to include(open_tale)
      expect(tales).to include(tale)
    end
  end
end

