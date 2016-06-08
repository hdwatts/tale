require 'rails_helper'

RSpec.describe UserDecorator do
  let (:user) { User.create!(first_name: "anne", last_name: "gi", email: "annegi@flatironschool.com", username: "angyangle", password: "angyitis", password_confirmation: "angyitis")}
  let (:time_created) { user.created_at }
  it 'should be able to be initialized with a user' do
    expect{ UserDecorator.new(user) }.to_not raise_error
  end

  it 'should return a formatted full name' do
    expect(UserDecorator.new(user).full_name).to eq('Anne Gi')
  end

  it 'should return a correctly formatted date' do
    expect(UserDecorator.new(user).formatted_join_date).to eq(time_created.strftime("%b %Y"))
  end

end