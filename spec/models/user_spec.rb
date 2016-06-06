require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when all the fields are normal' do
    let (:user) { User.new(first_name: "R", last_name: "Spec", username: "rspec", email: "r@spec.com", password: "password", password_confirmation: "password") }

    it 'should be valid' do
      expect(user.valid?).to be_truthy
    end

    it 'should save' do
      expect(user.save).to be_truthy
    end
  end
  context 'when missing a field' do
    let (:user) { User.new(first_name: "Madonna", last_name: nil, username: "madonna", password: "madonna", password_confirmation: "madonna") }
    
    it 'should not be valid' do
      expect(user.valid?).to be_falsey
    end

    it 'should not save' do
      expect(user.save).to be_falsey
    end
  end

  context 'when the password and password confirmation are different' do
    let (:user) { User.new(first_name: "R", last_name: "Spec", username: "rspec", email: "r@spec.com", password: "password", password_confirmation: "sassword") }

    it 'should not be valid' do
      expect(user.valid?).to be_falsey
    end

    it 'should not save' do
      expect(user.save).to be_falsey
    end
  end

  context 'when an email or username is not unique' do
    before { User.create!(first_name: "Original", last_name: "User", username: "originaluser", email: "originaluser@originaluser.com", password: "password", password_confirmation: "password") }
    let(:user_with_same_email) { User.new(first_name: "Copy", last_name: "Cat", username: "copycat", email: "originaluser@originaluser.com", password: "password", password_confirmation: "password") }
    let(:user_with_same_username) { User.new(first_name: "Copy", last_name: "Cat", username: "originaluser", email: "originaluser@originaluser.com", password: "password", password_confirmation: "password") }

    it 'should not be valid' do
      expect(user_with_same_email.valid?).to be_falsey
      expect(user_with_same_username.valid?).to be_falsey
    end

    it 'should not save' do
      expect(user_with_same_email.save).to be_falsey
      expect(user_with_same_username.save).to be_falsey
    end
  end


  context 'with an email that is not an email' do
    let (:user) { User.new(first_name: "R", last_name: "Spec", username: "rspec", email: "thisisnotanemail", password: "password", password_confirmation: "password") }

    it 'should not be valid' do
      expect(user.valid?).to be_falsey
    end

    it 'should not save' do
      expect(user.save).to be_falsey
    end
  end

  context 'with a password under six characters' do
    let (:user) { User.new(first_name: "R", last_name: "Spec", username: "rspec", email: "thisisnotanemail", password: "sword", password_confirmation: "sword") }

    it 'should not be valid' do
      expect(user.valid?).to be_falsey
    end

    it 'should not save' do
      expect(user.save).to be_falsey
    end
  end

  context 'when already created' do
    before do 
      @user = User.create!(first_name: "R", last_name: "Spec", username: "rspec", email: "r@spec.com", password: "password", password_confirmation: "password") 
      @owned_tale = Tale.create!(owner: @user)
      Line.create(tale: @owned_tale, user: @user, content: "This is a really great tale.")
      @other_user = User.create!(first_name: "Bob", last_name: "Hoskins", username: "bobhoskins", email: "bobhoskins@monalisa.com", password: "password", password_confirmation: "password") 
      @unowned_tale = Tale.create!(owner: @other_user)
      Line.create!(tale: @unowned_tale, user: @user, content: "This is also a really great tale.")
    end

    it 'should know which tales it created' do
      expect(@user.tales_owned[0]).to eq(@owned_tale)
    end

    it 'should know which tales it contributed to' do
      expect(@user.tales_contributed[0]).to eq(@unowned_tale)
    end

  end

end
