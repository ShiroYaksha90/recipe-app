require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Chris', email: 'chris@gmail.com', password: 'password123')
  end

  it 'checks if user is created successfully' do
    expect(@user).to be_valid
  end

  it 'checks if user will not be valid' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'checks user is not valid if email is not present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'checks user is not valid if password is not present' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
end
