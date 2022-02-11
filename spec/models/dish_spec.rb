require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:restaurant) { Restaurant.create(name: "Murakumi Udon") }
  let(:main) { Menu.create(name: "Starters", restaurant: restaurant) }
  let(:cook_dish) { Dish.create(name: 'Ramen', price: 5, menu: main) }

  it 'is valid if name and price fields have value' do
    expect { cook_dish }.to change { Dish.count }.by(1)
  end

  it "requires a price" do
    dish = Dish.new(price: nil, name: "Udon", menu: main)
    expect(dish).to_not be_valid
  end

  it "requires a name" do
    dish = Dish.new(price: 5, name: nil, menu: main)
    expect(dish).to_not be_valid
  end

  it "requires a price" do
    dish = Dish.new(price: nil, name: "Udon", menu: main)
    expect(dish).to_not be_valid
  end

  it "not valid if first item in menu with price 77 and " do
    dish = Dish.new(price: 77, name: "Fried Salmon", menu: main)
    expect(dish).to_not be_valid
  end

  it "not valid if total menu price is 77" do
    dish1 = Dish.create(price: 70, name: "Fried Salmon", menu: main)
    dish2 = Dish.new(price: 7, name: "Fried Squid", menu: main)
    expect(dish2).to_not be_valid
  end

  it "is valid if total menu price is not 77" do
    dish1 = Dish.create(price: 80, name: "Fried Salmon", menu: main)
    dish2 = Dish.new(price: 15, name: "Fried Squid", menu: main)
    expect(dish2).to be_valid
  end

  it "cannot have the same name under a menu" do
    dish1 = Dish.create(price: 15, name: "Fried Salmon", menu: main)
    dish2 = Dish.new(price: 15, name: "Fried Salmon", menu: main)
    expect(dish2).to_not be_valid
  end

  it "cannot have name starting with 'E'" do
    dish = Dish.new(price: 15, name: "Energy Drinks", menu: main)
    expect(dish).to_not be_valid
  end
end
