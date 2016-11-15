require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    # TRUE CHECKS
    it 'should be true with all params' do
      @user = User.new({
        first_name: 'Brett',
        last_name: 'Goss',
        email: 'brett@example.com',
        password: 'password',
        password_confirmation: 'password'
      })
      expect(@user.save).to be true
      expect(@user.errors.full_messages.empty?).to be true
    end

    # FALSE CHECKS
    it 'should be false with no params' do
      @user = User.new
      expect(@user.save).to be false
      expect(@user.errors.full_messages.empty?).to be false
    end

    it 'should be false with no first_name' do
      @user = User.new({
        last_name: 'Goss',
        email: 'brett@example.com',
        password: 'password',
        password_confirmation: 'password'
      })
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should be false with no last_name' do
      @user = User.new({
        first_name: 'Brett',
        email: 'brett@example.com',
        password: 'password',
        password_confirmation: 'password'
      })
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'should be false with no email' do
      @user = User.new({
        first_name: 'Brett',
        last_name: 'Goss',
        password: 'password',
        password_confirmation: 'password'
      })
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should be false with no password' do
      @user = User.new({
        first_name: 'Brett',
        last_name: 'Goss',
        email: 'brett@example.com',
      })
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "should be false if passwords don't match" do
      @user = User.new({
        first_name: 'Brett',
        last_name: 'Goss',
        email: 'brett@example.com',
        password: 'pass',
        password_confirmation: 'password'
      })
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
