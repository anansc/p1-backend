require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'shold validate presence of name' do
      user = User.new(name: nil)
      expect(user.valid?).to be_falsey
      expect(user.errors[:name]).to include("can't be blank")
    end
    it 'should validate presence of email' do
      user = User.new(email: nil)
      expect(user.valid?).to be_falsey
      expect(user.errors[:email]).to include("can't be blank")
    end
    it 'should validate uniqueness of email' do
      existing_user = User.create!(name: 'Existing User', email: "email@email")
      user = User.new(email: existing_user.email)
      expect(user.valid?).to be_falsey
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end
