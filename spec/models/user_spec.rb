require 'rails_helper'

RSpec.describe User, type: :model do
   describe 'Validations' do

    it 'should be valid if all parameters are present' do
      user1 = User.create(
        first_name: 'first',
        last_name: 'user',
        email: 'first@user.com',
        password: 'qwerty',
        password_confirmation: 'qwerty')
      expect(user1).to be_valid
    end

    it 'should check error if password and password_confirmation is not the same' do
      user1 = User.create(
        first_name: 'first',
        last_name: 'last',
        email: 'first@last.com',
        password: 'qwerty',
        password_confirmation: 'Qwerty')
      expect(user1.errors.has_key?(:password_confirmation)).to be_truthy
    end

    it 'should check error if password is nil' do
      user1 = User.create(
        first_name: 'first',
        last_name: 'last',
        email: 'first@last.com',
        password: nil,
        password_confirmation: 'qwerty')
      expect(user1.errors.has_key?(:password)).to be_truthy 
    end

    it 'should check error if password_confirmation is nil' do
      user1 = User.create(
        first_name: 'first',
        last_name: 'last',
        email: 'first@last.com',
        password: 'qwerty',
        password_confirmation: nil)
      expect(user1.errors.has_key?(:password_confirmation)).to be_truthy
    end

    it 'should check error if email is not unique and case sensitive' do
      user1 = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwerty',
        password_confirmation: 'qwerty')
      
      user2 = User.create(
        first_name: 'next',
        last_name: 'user',
        email: 'CURRENT@USER.com',
        password: 'qwer12',
        password_confirmation: 'qwer12')
      expect(user2.errors.has_key?(:email)).to be_truthy
    end

    it 'should check error if password is below minimum' do
      user1 = User.create(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwe',
        password_confirmation: 'qwe')
      expect(user1.errors.has_key?(:password)).to be_truthy
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should check if email and password is in the db' do
      user1 = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwerty1',
        password_confirmation: 'qwerty1')
      session = User.authenticate_with_credentials('current@user.com', 'qwerty1')
      expect(session).to eq user1
    end

    it 'should check if email is incorrect' do
      user1 = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwerty1',
        password_confirmation: 'qwerty1')
      session = User.authenticate_with_credentials('current1@user.com', 'qwerty1')
      expect(session).not_to eq user1
    end

    it 'should check if password is incorrect' do
      user1 = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwerty1',
        password_confirmation: 'qwerty1')
      session = User.authenticate_with_credentials('current1@user.com', 'qwerty12')
      expect(session).not_to eq user1
    end

    it 'should still log-in if email has whitespace' do
      user1 = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwerty1',
        password_confirmation: 'qwerty1')
      session = User.authenticate_with_credentials('current@user.com   ', 'qwerty1')
      expect(session).to eq user1
    end

    it 'should still log-in if email has wrong case' do
      user1 = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwerty1',
        password_confirmation: 'qwerty1')
      session = User.authenticate_with_credentials('CuRrEnT@uSeR.cOm', 'qwerty1')
      expect(session).to eq user1
    end

  end
end
