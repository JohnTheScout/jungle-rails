require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save properly' do
      user = User.new(first_name: 'John', last_name: 'Goff', email: 'whoo@lad.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user.save).to be true
    end

    context 'Missing information' do 
      it "shouldn't save if first_name is missing" do
        user = User.new(first_name: nil, last_name: 'Goff', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        expect(user.save).to be false
      end
      it "shouldn't save if last_name is missing" do
        user = User.new(first_name: 'John', last_name: nil, email: 'test@test.com', password: 'test', password_confirmation: 'test')
        expect(user.save).to be false
      end
      it "shouldn't save if email is missing" do
        user = User.new(first_name: 'John', last_name: 'Goff', email: nil, password: 'test', password_confirmation: 'test')
        expect(user.save).to be false
      end
      it "shouldn't save if password is missing" do
        user = User.new(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: nil, password_confirmation: 'test')
        expect(user.save).to be false
      end
      it "shouldn't save if password_confirmation is missing" do
        user = User.new(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'test', password_confirmation: '')
        expect(user.save).to be false
      end
    end
    
    context "Passwords don't match" do 
      it 'should not save' do
        user = User.new(first_name: 'John', last_name: 'Goff', email: 'whoo@lad.com', password: 'test', password_confirmation: 'wrong')
        expect(user.save).to be false
      end
    end

    context "email already exists" do
      it 'should not save' do
        user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        user2 = User.new(first_name: 'Drew', last_name: 'Goff', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        expect(user2.save).to be false
      end
      it 'should not save even when case does not match' do
        user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        user2 = User.new(first_name: 'Drew', last_name: 'Goff', email: 'TEST@test.com', password: 'test', password_confirmation: 'test')
        expect(user2.save).to be false
      end
      it 'should not save even when case does not match' do
        user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        user2 = User.new(first_name: 'Drew', last_name: 'Goff', email: 'test@TEST.com', password: 'test', password_confirmation: 'test')
        expect(user2.save).to be false
      end
      it 'should not save even when case does not match' do
        user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        user2 = User.new(first_name: 'Drew', last_name: 'Goff', email: 'test@test.COM', password: 'test', password_confirmation: 'test')
        expect(user2.save).to be false
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user if auth is correct' do
      user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      user2 = User.authenticate_with_credentials('test@test.com', 'testtest')
      expect(user2).to_not be_nil
    end
    it 'should return nil if auth is incorrect' do
      user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      user2 = User.authenticate_with_credentials('test@test.com', 'test')
      expect(user2).to be_nil
    end
    it 'should return nil if auth is incorrect' do
      user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      user2 = User.authenticate_with_credentials('blah@test.com', 'testtest')
      expect(user2).to be_nil
    end
    it 'should allow login with incorrect case' do
      user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      user2 = User.authenticate_with_credentials('TEST@test.cOm', 'testtest')
      expect(user2).to_not be_nil
    end
    it 'should allow login with incorrect case' do
      user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@TesT.cOM', password: 'testtest', password_confirmation: 'testtest')
      user2 = User.authenticate_with_credentials('TEST@test.cOm', 'testtest')
      expect(user2).to_not be_nil
    end
    it 'should allow login with spaces in email' do
      user = User.create(first_name: 'John', last_name: 'Goff', email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      user2 = User.authenticate_with_credentials('  test@test.com ', 'testtest')
      expect(user2).to_not be_nil
    end
  end
end
