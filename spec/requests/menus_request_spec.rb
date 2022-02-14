require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe "GET /index" do
    let(:restaurant) { Restaurant.create(name: "Murakumi Udon") }
    let(:appetizers) { Menu.new(name: "Appetizers", restaurant: restaurant) }
    let!(:peas) { Dish.create(name: 'Peas', price: 5, menu: appetizers) }

    it "returns menus" do
      get "/menus"
      body = JSON.parse(response.body)
      dishes = body.first['dishes']
      expect(response.status).to eq(200)
      expect(body.first['name']).to eq("Appetizers")
      expect(dishes.first['name']).to eq("Peas")
      expect(dishes.first['price']).to eq("5.0")
    end
  end
end
