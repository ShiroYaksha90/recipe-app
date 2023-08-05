require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.new(name: 'Wise', email: 'wise@gmail.com', password: 'password123')
    @food = Food.create(name: 'chicken', user: @user, price: 5, measurement_unit: 'kg', quantity: 4, user_id: @user.id)
  end

  it 'checks if food is successfully created' do
    expect(@food).to be_valid
  end

  it 'checks it is not valid if user is not present' do
    @food.user = nil
    expect(@food).to_not be_valid
  end

  it 'checks it is not created successfully without a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'checks it is not successfully created without a quantity' do
    @food.quantity = nil
    expect(@food).to_not be_valid
  end

  it 'checks if parameters are exactly what is saved ' do
    expect(@food.name).to eql 'chicken'
  end
end
