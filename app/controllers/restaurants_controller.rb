class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.find_by_id(current_restaurant_id)

    if @restaurant.present?
      @menus = @restaurant.menus.includes(:dishes)
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      cookies[:restaurant_id] = @restaurant.id
      redirect_to root_path
    else
      @error = @restaurant.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
